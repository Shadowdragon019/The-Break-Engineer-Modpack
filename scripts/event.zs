import crafttweaker.api.world.ServerLevel;
import crafttweaker.forge.api.event.EventResult;
import crafttweaker.api.util.math.BlockPos;
import crafttweaker.forge.api.event.tick.PlayerTickEvent;

public function blockPosesAreEqual(a as BlockPos, b as BlockPos) as bool {
	return (a.x == b.x && a.y == b.y && a.z == b.z);
}

events.register<crafttweaker.forge.api.event.interact.RightClickBlockEvent>(event => {
	var blockPos = event.blockPos;
	var player = event.entity;
	var level = player.level;
	var blockState = level.getBlockState(blockPos);
	var block = blockState.block;
	var stack = event.itemStack;
	var hand = event.hand;
	var random = level.random;

	if (block == <block:kubejs:shovel>) {
		player.swing(hand);
		level.setBlockAndUpdate(blockPos, <blockstate:minecraft:air>);
		player.addItem(<item:minecraft:wooden_shovel>.withTag({
			CanDestroy:["minecraft:gravel"],display:{Name:'{"text":"Electronic Shovel","italic":false}',Lore:['{"text":"\\"A normal shovel equipped with various technologies. Has various features like being expensive, fragile, inoperable unless signed in & so much more.\\"","color":"gray","bold":false,"italic":false}','{"text":"Can be used for parts.","color":"gold","bold":true,"italic":false}']},HideFlags:10,Damage:43
		}));
		if (level is ServerLevel) {
			(level as ServerLevel).server.executeCommand("function the_breaking_engineer:delayed_dialogue/storage_room/get_shovel", true);
		}
	} else if (block == <block:breaking_tools_drops_items:panel> && blockState.properties["panel_state"] == "fixed") {
		if (level is ServerLevel) {
			var serverLevel = level as ServerLevel;
			if (blockPosesAreEqual(blockPos , new BlockPos(45, -57, 2))) {
				serverLevel.server.executeCommand("function the_breaking_engineer:delayed_dialogue/storage_room/escape_1", true);
				serverLevel.server.executeCommand("schedule function the_breaking_engineer:delayed_dialogue/storage_room/escape_2 2s", true);
				serverLevel.server.executeCommand("schedule function the_breaking_engineer:delayed_dialogue/storage_room/escape_3 4s", true);
				serverLevel.server.executeCommand("schedule function the_breaking_engineer:delayed_dialogue/storage_room/escape_4 8s", true);
			}
		}
	} else if (block == <block:kubejs:tablet>) {
		player.swing(hand);
		level.setBlockAndUpdate(blockPos, <blockstate:minecraft:air>);
		player.addItem(<item:kubejs:tablet>.withTag({
			CanDestroy:["kubejs:machine"],display:{Lore:['{"text":"My boss\'s tablet. It should have his id card inside. I hope he won\'t be too mad if I smash this thing to pieces... or I could just not tell him.","color":"gray","bold":false,"italic":false}','{"text":"Can be used for parts.","color":"gold","bold":true,"italic":false}']},HideFlags:10
		}));
		if (level is ServerLevel) {
			(level as ServerLevel).server.executeCommand("function the_breaking_engineer:delayed_dialogue/big_room/get_tablet", true);
		}
	} else if (block == <block:kubejs:energy_fairy>) {
		player.swing(event.hand);
		player.addItem(<item:kubejs:energy_fairy>);
		level.setBlockAndUpdate(blockPos, <blockstate:minecraft:air>);
		if (level is ServerLevel) {
			(level as ServerLevel).server.executeCommand("function the_breaking_engineer:delayed_dialogue/energy_control_room/obtain_fairy", true); // "Ahhh! Let go of me you rubber gloved maniac!"
		}
	} else if (stack.withoutTag() == <item:kubejs:energy_fairy>.withoutTag()) {
		if (block == <block:kubejs:active_zapper>) {
			player.setItemInHand(hand, stack.withDamage(stack.damage - 6));
			player.swing(hand);
			if (level is ServerLevel) {
				var thingsToSay = ["HAH", "HAHA", "YAY ENERGY!!", "Thank you~", "HEHEHEEEE", "YOU'LL NEVER DEFEAT MEE!!!", "Ohh YEAHHHH", "Gimme more!", "YIIIIS"];
				(level as ServerLevel).server.executeCommand("tellraw @a {\"text\":\"[Energy Fairy] " + thingsToSay[random.nextInt(9)] + "\",\"color\":\"red\"}", true);
				(level as ServerLevel).server.executeCommand("function the_breaking_engineer:events/new_dialogue_message", true);
			}
		} else if (block == <block:kubejs:inactive_zapper>) {
			player.setItemInHand(hand, stack.withDamage(stack.damage + 6));
			player.swing(hand);
			if (stack.damage >= stack.maxDamage - 1) {
				player.setItemInHand(hand, <item:minecraft:air>);
				if (level is ServerLevel) {
					(level as ServerLevel).server.executeCommand("tellraw @a {\"text\":\"[Energy Fairy] BAH! I GIVE UP!!" + "\",\"color\":\"gold\"}", true);
					(level as ServerLevel).server.executeCommand("function the_breaking_engineer:events/new_dialogue_message", true);
				}
			} else if (level is ServerLevel) {
				var thingsToSay = ["OW", "PRICK", "NO MY ENERGY", "HEY", "I HAVE CONNECTIONS", "I'LL GET YOU FIRED", "AHHHHHH", "AHHH", "FEEL PAAAAAIN"];
				(level as ServerLevel).server.executeCommand("tellraw @a {\"text\":\"[Energy Fairy] " + thingsToSay[random.nextInt(9)] + "\",\"color\":\"green\"}", true);
				(level as ServerLevel).server.executeCommand("function the_breaking_engineer:events/new_dialogue_message", true);
			}
		}
	}
	// No, lmao
	//println((new BlockGetter()).getBlockState(blockPos) as string);
});

events.register<PlayerTickEvent>(event => {
	event.every(20, (event2) => {
		var inventory = event2.player.inventory;
		println(event2.cancelable);
		for i in 0 .. inventory.containerSize {
			val item = inventory.getItem(i).asIItemStack();
			if (event2.player.level is ServerLevel && item.withoutTag() == <item:kubejs:energy_fairy>.withoutTag()) {
				inventory.setItem(i, item.withDamage(item.damage - 1)); // Runs twice, don't care to figure out'
			}
		}

	});
});
