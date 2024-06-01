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
setblock 79 -23 -109 kubejs:machine
# Panels/Doors
## Storage room
setblock 45 -57 2 breaking_tools_drops_items:panel[facing=south,panel_state=broken]
# I do not know where I fill in the door
## Left
setblock 23 -22 -38 breaking_tools_drops_items:panel[facing=east,panel_state=broken]
fill 22 -23 -39 22 -21 -41 minecraft:iron_block
setblock 9 -22 -26 breaking_tools_drops_items:panel[facing=north,panel_state=broken]
fill 8 -23 -25 6 -21 -25 minecraft:iron_block
setblock -7 -22 -38 breaking_tools_drops_items:panel[facing=east,panel_state=broken]
fill -8 -23 -39 -8 -21 -41 minecraft:iron_block
setblock 5 -22 -54 breaking_tools_drops_items:panel[facing=south,panel_state=broken]
fill 6 -23 -55 8 -21 -55 minecraft:iron_block
## Right
setblock 71 -22 -42 breaking_tools_drops_items:panel[facing=west,panel_state=broken]
fill 72 -23 -41 72 -21 -39 minecraft:iron_block
setblock 85 -22 -54 breaking_tools_drops_items:panel[facing=south,panel_state=broken]
fill 86 -23 -55 88 -21 -55 minecraft:iron_block
setblock 101 -22 -42 breaking_tools_drops_items:panel[facing=west,panel_state=broken]
fill 102 -23 -41 102 -21 -39 minecraft:iron_block
setblock 89 -22 -26 breaking_tools_drops_items:panel[facing=north,panel_state=broken]
fill 88 -23 -25 86 -21 -25 minecraft:iron_block
## Hallway
setblock 45 -22 -64 breaking_tools_drops_items:panel[facing=south,panel_state=broken]
fill 46 -23 -65 48 -21 -65 minecraft:iron_block
setblock 45 -22 -78 breaking_tools_drops_items:panel[facing=south,panel_state=broken]
fill 46 -23 -79 48 -21 -79 minecraft:iron_block
setblock 45 -22 -92 breaking_tools_drops_items:panel[facing=south,panel_state=broken]
fill 46 -23 -93 48 -21 -93 minecraft:iron_block
## Front
setblock 33 -22 -106 breaking_tools_drops_items:panel[facing=east,panel_state=broken]
fill 32 -23 -107 32 -21 -109 minecraft:iron_block
setblock 45 -22 -122 breaking_tools_drops_items:panel[facing=south,panel_state=broken]
fill 46 -23 -123 48 -21 -123 minecraft:iron_block
setblock 61 -22 -110 breaking_tools_drops_items:panel[facing=west,panel_state=broken]
fill 62 -23 -109 62 -21 -107 minecraft:iron_block
fill 46 -23 -153 48 -21 -153 minecraft:iron_block
# L I G H T
setblock 47 -13 -182 kubejs:energy_fairy


# Tp player to right position for the start of the game
tp @a 47 -58 2.3 0 0

# I don't like that scoreboard is stored through entities instead of world
#  Flags
#   Storage room
# Inspected panel
setblock 55 -50 1 minecraft:red_terracotta
# Seen energy fairy
setblock 47 -9 -170 minecraft:red_terracotta
