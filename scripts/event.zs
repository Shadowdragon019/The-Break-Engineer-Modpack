import crafttweaker.api.world.ServerLevel;
import crafttweaker.forge.api.event.EventResult;
import crafttweaker.api.util.math.BlockPos;

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

	if (block == <block:kubejs:shovel>) {
		player.swing(event.hand);
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
		player.swing(event.hand);
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
			player.setItemInHand(hand, stack.withDamage(stack.damage - 1));
		} else if (block == <block:kubejs:inactive_zapper>) {
			player.setItemInHand(hand, stack.withDamage(stack.damage + 1));
			if (stack.damage >= stack.maxDamage - 1) {
				player.setItemInHand(hand, <item:minecraft:air>);
			}
		}
	}
	// No, lmao
	//println((new BlockGetter()).getBlockState(blockPos) as string);
});
