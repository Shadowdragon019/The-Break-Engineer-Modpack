#This code is executed when a new game happens

schedule function the_breaking_engineer:delayed_dialogue/storage_room/spawn 10t
gamemode adventure @a
clear @a

# Enable lighting in storage room
setblock 38 -60 -1 minecraft:redstone_block
setblock 38 -60 -1 minecraft:air
# Tp player to right position for the start of the game
tp @a 47 -58 2.3 0 0

# I don't like that scoreboard is stored through entities instead of world
#  Flags
#   Storage room
# Inspected panel
setblock 55 -50 1 minecraft:red_terracotta
