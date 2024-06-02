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

# Disable lamps
# Thankfully I'm a programmer & have CT :3
setblock 42 -53 -4 air
setblock 47 -53 -4 air
setblock 52 -53 -4 air
setblock 47 -53 -12 air
setblock 47 -49 -17 air
setblock 47 -45 -26 air
setblock 47 -45 -22 air
setblock 47 -45 -30 air
setblock 47 -45 -34 air
setblock 55 -45 -26 air
setblock 51 -45 -26 air
setblock 43 -45 -26 air
setblock 38 -42 -26 air
setblock 33 -38 -26 air
setblock 25 -38 -26 air
setblock 21 -38 -26 air
setblock 29 -38 -26 air
setblock 29 -38 -30 air
setblock 29 -38 -34 air
setblock 29 -38 -22 air
setblock 29 -35 -17 air
setblock 29 -31 -12 air
setblock 29 -31 -8 air
setblock 29 -31 -4 air
setblock 29 -31 0 air
setblock 25 -31 -8 air
setblock 21 -31 -8 air
setblock 33 -31 -8 air
setblock 38 -28 -8 air
setblock 43 -24 -8 air
setblock 47 -24 -8 air
setblock 51 -24 -8 air
setblock 55 -24 -8 air
setblock 47 -24 -4 air
setblock 47 -24 0 air
setblock 47 -24 -12 air
setblock 47 -21 -17 air
setblock 47 -17 -22 air
setblock 47 -17 -29 air
setblock 47 -17 -30 air
setblock 58 -17 -29 air
setblock 58 -17 -30 air
setblock 57 -17 -30 air
setblock 57 -17 -29 air
setblock 36 -17 -30 air
setblock 36 -17 -29 air
setblock 37 -17 -29 air
setblock 37 -17 -30 air
setblock 36 -17 -40 air
setblock 37 -17 -40 air
setblock 36 -17 -51 air
setblock 37 -17 -51 air
setblock 36 -17 -50 air
setblock 37 -17 -50 air
setblock 47 -17 -51 air
setblock 47 -17 -50 air
setblock 58 -17 -51 air
setblock 58 -17 -50 air
setblock 57 -17 -50 air
setblock 57 -17 -51 air
setblock 58 -17 -40 air
setblock 57 -17 -40 air
setblock 47 -17 -40 air
setblock 29 -17 -40 air
setblock 25 -17 -40 air
setblock 19 -17 -40 air
setblock 15 -17 -40 air
setblock 7 -17 -40 air
setblock 4 -17 -37 air
setblock 10 -17 -37 air
setblock 10 -17 -43 air
setblock 4 -17 -43 air
setblock -5 -17 -40 air
setblock -1 -17 -40 air
setblock -11 -17 -40 air
setblock -15 -17 -40 air
setblock -23 -17 -40 air
setblock -20 -17 -37 air
setblock -23 -17 -28 air
setblock -23 -17 -22 air
setblock -23 -17 -32 air
setblock -26 -17 -37 air
setblock -35 -17 -40 air
setblock -41 -17 -40 air
setblock -31 -17 -40 air
setblock -26 -17 -43 air
setblock -20 -17 -43 air
setblock -23 -17 -48 air
setblock -23 -17 -52 air
setblock -23 -17 -58 air
setblock 7 -17 -48 air
setblock 7 -17 -52 air
setblock 7 -17 -58 air
setblock 7 -17 -62 air
setblock 4 -17 -67 air
setblock -1 -17 -70 air
setblock -5 -17 -70 air
setblock -11 -17 -70 air
setblock 7 -17 -88 air
setblock 7 -17 -82 air
setblock 7 -17 -78 air
setblock 4 -17 -73 air
setblock 7 -17 -70 air
setblock 10 -17 -67 air
setblock 15 -17 -70 air
setblock 19 -17 -70 air
setblock 25 -17 -70 air
setblock 10 -17 -73 air
setblock 7 -17 -32 air
setblock 7 -17 -28 air
setblock 7 -17 -22 air
setblock 7 -17 -19 air
setblock 10 -17 -14 air
setblock 15 -17 -11 air
setblock 19 -17 -11 air
setblock 25 -17 -11 air
setblock 10 -17 -8 air
setblock 7 -17 -11 air
setblock 4 -17 -8 air
setblock 7 -17 -3 air
setblock 7 -17 1 air
setblock 7 -17 7 air
setblock -11 -17 -11 air
setblock -5 -17 -11 air
setblock -1 -17 -11 air
setblock 4 -17 -14 air
setblock 65 -17 -40 air
setblock 69 -17 -40 air
setblock 75 -17 -40 air
setblock 79 -17 -40 air
setblock 84 -17 -43 air
setblock 87 -17 -40 air
setblock 90 -17 -43 air
setblock 90 -17 -37 air
setblock 84 -17 -37 air
setblock 87 -17 -32 air
setblock 87 -17 -28 air
setblock 87 -17 -18 air
setblock 87 -17 -22 air
setblock 84 -17 -13 air
setblock 79 -17 -10 air
setblock 69 -17 -10 air
setblock 75 -17 -10 air
setblock 84 -17 -7 air
setblock 87 -17 -10 air
setblock 90 -17 -13 air
setblock 90 -17 -7 air
setblock 95 -17 -10 air
setblock 99 -17 -10 air
setblock 105 -17 -10 air
setblock 87 -17 -2 air
setblock 87 -17 2 air
setblock 87 -17 8 air
setblock 95 -17 -40 air
setblock 99 -17 -40 air
setblock 105 -17 -40 air
setblock 109 -17 -40 air
setblock 117 -17 -40 air
setblock 114 -17 -43 air
setblock 120 -17 -43 air
setblock 117 -17 -48 air
setblock 117 -17 -52 air
setblock 129 -17 -40 air
setblock 135 -17 -40 air
setblock 125 -17 -40 air
setblock 120 -17 -37 air
setblock 117 -17 -28 air
setblock 117 -17 -22 air
setblock 117 -17 -32 air
setblock 114 -17 -37 air
setblock 87 -17 -48 air
setblock 87 -17 -52 air
setblock 87 -17 -58 air
setblock 87 -17 -62 air
setblock 84 -17 -67 air
setblock 79 -17 -70 air
setblock 75 -17 -70 air
setblock 69 -17 -70 air
setblock 87 -17 -78 air
setblock 84 -17 -73 air
setblock 87 -17 -82 air
setblock 87 -17 -88 air
setblock 90 -17 -73 air
setblock 95 -17 -70 air
setblock 105 -17 -70 air
setblock 99 -17 -70 air
setblock 87 -17 -70 air
setblock 90 -17 -67 air
setblock 47 -17 -58 air
setblock 47 -17 -62 air
setblock 47 -17 -68 air
setblock 47 -17 -72 air
setblock 47 -17 -76 air
setblock 47 -17 -82 air
setblock 47 -17 -86 air
setblock 47 -17 -90 air
setblock 47 -17 -96 air
setblock 47 -17 -100 air
setblock 44 -17 -105 air
setblock 44 -17 -111 air
setblock 47 -17 -108 air
setblock 50 -17 -111 air
setblock 50 -17 -105 air
setblock 55 -17 -108 air
setblock 59 -17 -108 air
setblock 65 -17 -108 air
setblock 69 -17 -108 air
setblock 74 -17 -105 air
setblock 77 -17 -100 air
setblock 77 -17 -96 air
setblock 80 -17 -105 air
setblock 77 -17 -108 air
setblock 74 -17 -111 air
setblock 77 -17 -116 air
setblock 77 -17 -120 air
setblock 77 -17 -126 air
setblock 80 -17 -111 air
setblock 85 -17 -108 air
setblock 95 -17 -108 air
setblock 89 -17 -108 air
setblock 35 -17 -108 air
setblock 39 -17 -108 air
setblock 29 -17 -108 air
setblock 25 -17 -108 air
setblock 20 -17 -105 air
setblock 17 -17 -100 air
setblock 17 -17 -96 air
setblock 14 -17 -105 air
setblock 9 -17 -108 air
setblock 5 -17 -108 air
setblock -1 -17 -108 air
setblock 14 -17 -111 air
setblock 17 -17 -116 air
setblock 17 -17 -120 air
setblock 17 -17 -126 air
setblock 20 -17 -111 air
setblock 17 -17 -108 air
setblock 47 -17 -120 air
setblock 47 -17 -116 air
setblock 47 -17 -126 air
setblock 47 -17 -130 air
setblock 44 -17 -135 air
setblock 39 -17 -138 air
setblock 35 -17 -138 air
setblock 29 -17 -138 air
setblock 44 -17 -141 air
setblock 47 -17 -138 air
setblock 50 -17 -141 air
setblock 50 -17 -135 air
setblock 55 -17 -138 air
setblock 59 -17 -138 air
setblock 65 -17 -138 air
setblock 47 -17 -146 air
setblock 47 -17 -150 air
setblock 47 -17 -156 air
setblock 47 -17 -160 air
setblock 47 -14 -165 air
setblock 47 -10 -170 air
setblock 47 -10 -178 air
setblock 44 -10 -181 air
setblock 50 -10 -181 air
setblock 50 -10 -175 air
setblock 44 -10 -175 air

effect clear @a

# Tp player to right position for the start of the game
tp @a 47 -58 2.3 0 0

# I don't like that scoreboard is stored through entities instead of world
#  Flags
#   Storage room
# Inspected panel
setblock 55 -50 1 minecraft:red_terracotta
# Seen energy fairy
setblock 47 -9 -170 minecraft:red_terracotta
