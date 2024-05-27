# Knock out power in storage room
setblock 47 -52 10 air

execute as @a at @s run playsound minecraft:block.glass.break neutral @s ~ ~ ~
execute as @a at @s run playsound minecraft:block.glass.break neutral @s ~ ~ ~
schedule function the_breaking_engineer:delayed_dialogue/storage_room/power_goes_out_1 1s
schedule function the_breaking_engineer:delayed_dialogue/storage_room/power_goes_out_2 3s
