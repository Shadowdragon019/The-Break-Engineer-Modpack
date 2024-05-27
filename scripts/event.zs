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

	if (block == <block:kubejs:shovel>) {
		level.setBlockAndUpdate(blockPos, <blockstate:minecraft:air>);
		player.addItem(<item:minecraft:wooden_shovel>.withTag({
			CanDestroy:["minecraft:gravel"],display:{Name:'{"text":"Electronic Shovel","italic":false}',Lore:['{"text":"\\"A normal shovel equipped with various technologies. Has various features like being expensive, fragile, inoperable unless signed in & so much more!!\\"","color":"gray","bold":false,"italic":false}','{"text":"Could be used for parts.","color":"gold","bold":true,"italic":false}']},HideFlags:10,Damage:43
		}));
		if (level is ServerLevel) {
			(level as ServerLevel).server.executeCommand("function the_breaking_engineer:delayed_dialogue/storage_room/get_shovel", true);
		}
		player.swing(event.hand);
	} else if (block == <block:minecraft:iron_trapdoor> && stack == <item:kubejs:electronic_parts>) {
		player.swing(event.hand);
		player.inventory.removeItem(stack);
		if (level is ServerLevel) {
			var serverLevel = level as ServerLevel;
			if (blockPosesAreEqual(blockPos , new BlockPos(45, -57, 2))) {
				serverLevel.server.executeCommand("fill 46 -58 1 48 -56 1 air", true);
				serverLevel.server.executeCommand("function the_breaking_engineer:delayed_dialogue/storage_room/escape", true);
			}
		}
	}
	// No, lmao
	//println((new BlockGetter()).getBlockState(blockPos) as string);
});

