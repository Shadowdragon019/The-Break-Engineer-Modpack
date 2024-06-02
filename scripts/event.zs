import crafttweaker.api.world.ServerLevel;
import crafttweaker.forge.api.event.EventResult;
import crafttweaker.api.util.math.BlockPos;
import crafttweaker.forge.api.event.tick.PlayerTickEvent;
import stdlib.List;

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
					level.setBlockAndUpdate(new BlockPos(47, -52, 10), <blockstate:minecraft:redstone_block>);
					// Generated
					level.setBlockAndUpdate(new BlockPos(42, -53, -4), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -53, -4), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(52, -53, -4), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -53, -12), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -49, -17), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -45, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -45, -22), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -45, -30), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -45, -34), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(55, -45, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(51, -45, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(43, -45, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(38, -42, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(33, -38, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(25, -38, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(21, -38, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -38, -26), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -38, -30), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -38, -34), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -38, -22), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -35, -17), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -31, -12), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -31, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -31, -4), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -31, 0), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(25, -31, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(21, -31, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(33, -31, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(38, -28, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(43, -24, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -24, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(51, -24, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(55, -24, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -24, -4), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -24, 0), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -24, -12), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -21, -17), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -22), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -29), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -30), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(58, -17, -29), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(58, -17, -30), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(57, -17, -30), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(57, -17, -29), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(36, -17, -30), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(36, -17, -29), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(37, -17, -29), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(37, -17, -30), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(36, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(37, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(36, -17, -51), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(37, -17, -51), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(36, -17, -50), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(37, -17, -50), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -51), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -50), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(58, -17, -51), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(58, -17, -50), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(57, -17, -50), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(57, -17, -51), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(58, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(57, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(25, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(19, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(15, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(4, -17, -37), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(10, -17, -37), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(10, -17, -43), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(4, -17, -43), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-5, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-1, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-11, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-15, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-23, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-20, -17, -37), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-23, -17, -28), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-23, -17, -22), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-23, -17, -32), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-26, -17, -37), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-35, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-41, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-31, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-26, -17, -43), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-20, -17, -43), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-23, -17, -48), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-23, -17, -52), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-23, -17, -58), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -48), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -52), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -58), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -62), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(4, -17, -67), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-1, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-5, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-11, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -88), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -82), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -78), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(4, -17, -73), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(10, -17, -67), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(15, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(19, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(25, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(10, -17, -73), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -32), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -28), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -22), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -19), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(10, -17, -14), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(15, -17, -11), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(19, -17, -11), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(25, -17, -11), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(10, -17, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -11), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(4, -17, -8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, -3), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, 1), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(7, -17, 7), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-11, -17, -11), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-5, -17, -11), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-1, -17, -11), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(4, -17, -14), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(65, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(69, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(75, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(79, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(84, -17, -43), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(90, -17, -43), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(90, -17, -37), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(84, -17, -37), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -32), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -28), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -18), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -22), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(84, -17, -13), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(79, -17, -10), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(69, -17, -10), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(75, -17, -10), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(84, -17, -7), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -10), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(90, -17, -13), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(90, -17, -7), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(95, -17, -10), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(99, -17, -10), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(105, -17, -10), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -2), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, 2), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, 8), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(95, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(99, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(105, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(109, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(117, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(114, -17, -43), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(120, -17, -43), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(117, -17, -48), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(117, -17, -52), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(129, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(135, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(125, -17, -40), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(120, -17, -37), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(117, -17, -28), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(117, -17, -22), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(117, -17, -32), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(114, -17, -37), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -48), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -52), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -58), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -62), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(84, -17, -67), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(79, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(75, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(69, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -78), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(84, -17, -73), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -82), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -88), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(90, -17, -73), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(95, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(105, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(99, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(87, -17, -70), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(90, -17, -67), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -58), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -62), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -68), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -72), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -76), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -82), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -86), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -90), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -96), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -100), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(44, -17, -105), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(44, -17, -111), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(50, -17, -111), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(50, -17, -105), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(55, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(59, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(65, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(69, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(74, -17, -105), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(77, -17, -100), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(77, -17, -96), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(80, -17, -105), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(77, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(74, -17, -111), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(77, -17, -116), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(77, -17, -120), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(77, -17, -126), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(80, -17, -111), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(85, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(95, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(89, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(35, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(39, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(25, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(20, -17, -105), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(17, -17, -100), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(17, -17, -96), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(14, -17, -105), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(9, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(5, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(-1, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(14, -17, -111), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(17, -17, -116), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(17, -17, -120), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(17, -17, -126), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(20, -17, -111), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(17, -17, -108), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -120), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -116), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -126), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -130), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(44, -17, -135), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(39, -17, -138), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(35, -17, -138), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(29, -17, -138), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(44, -17, -141), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -138), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(50, -17, -141), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(50, -17, -135), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(55, -17, -138), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(59, -17, -138), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(65, -17, -138), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -146), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -150), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -156), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -17, -160), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -14, -165), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -10, -170), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(47, -10, -178), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(44, -10, -181), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(50, -10, -181), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(50, -10, -175), <blockstate:minecraft:redstone_block>);
					level.setBlockAndUpdate(new BlockPos(44, -10, -175), <blockstate:minecraft:redstone_block>);
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
		//println(event2.cancelable);
		for i in 0 .. inventory.containerSize {
			val item = inventory.getItem(i).asIItemStack();
			if (event2.player.level is ServerLevel && item.withoutTag() == <item:kubejs:energy_fairy>.withoutTag()) {
				inventory.setItem(i, item.withDamage(item.damage - 1)); // Runs twice, don't care to figure out'
			}
		}

	});
});
