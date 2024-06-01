# Storage room
## Knock out power
execute if entity @a[x=40,y=-58,z=12,dx=14,dy=3,dz=6] if block 47 -52 10 redstone_block run function the_breaking_engineer:events/power_goes_out
## Inspect panel
execute if entity @a[x=45,y=-58,z=2,dx=0,dy=1,dz=0] if block 55 -50 1 minecraft:red_terracotta if block 47 -52 10 air run function the_breaking_engineer:events/inspect_panel
## See energy fairy
execute if entity @a[x=46,y=-16,z=-170,dx=2,dy=4,dz=0] if block 47 -9 -170 minecraft:red_terracotta run function the_breaking_engineer:events/see_energy_fairy
