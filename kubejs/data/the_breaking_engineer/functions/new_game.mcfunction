#This code is executed when a new game happens

schedule function the_breaking_engineer:delayed_dialogue/storage_room/spawn 10t
gamemode adventure @a
clear @a

# Enable lighting in storage room
setblock 38 -60 -1 minecraft:redstone_block
setblock 38 -60 -1 minecraft:air
# Place tablet
setblock 42 -23 -47 kubejs:tablet
# Place machines
## Front
setblock 59 -23 -34 kubejs:machine
## Left
setblock 11 -23 -36 kubejs:machine
setblock 3 -23 -16 kubejs:machine
setblock -27 -23 -35 kubejs:machine
setblock 12 -23 -75 kubejs:machine
## Right
setblock 86 -23 -41 kubejs:machine
setblock 87 -23 -67 kubejs:machine
setblock 117 -23 -41 kubejs:machine
setblock 90 -23 -9 kubejs:machine
## Long hallway
setblock 46 -23 -75 kubejs:machine
setblock 48 -23 -88 kubejs:machine
## Middle
setblock 48 -23 -108 kubejs:machine
setblock 20 -23 -104 kubejs:machine
setblock 54 -23 -139 kubejs:machine
setblock 79 -23 -109 kubejs:machine

# Tp player to right position for the start of the game
tp @a 47 -58 2.3 0 0

# I don't like that scoreboard is stored through entities instead of world
#  Flags
#   Storage room
# Inspected panel
setblock 55 -50 1 minecraft:red_terracotta
