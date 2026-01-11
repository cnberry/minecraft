say [DEBUG] fire.mcfunction: start @s

tag @s add myguns_shooter
scoreboard players set @s myguns_raycast_steps 80
title @s actionbar {"text":"Gun fired","color":"yellow"}

# === TEST 1: original
execute anchored eyes positioned ^ ^ ^0.5 run function myguns:raycast
# === TEST 2: only at player, not anchored
execute at @s positioned ^ ^ ^0.5 run function myguns:raycast
# === TEST 3: anchored feet
execute anchored feet positioned ^ ^ ^0.5 run function myguns:raycast
# === TEST 4: anchored eyes, not positioned
execute anchored eyes run function myguns:raycast
# === TEST 5: anchored eyes, positioned, larger step
execute anchored eyes positioned ^ ^ ^1.0 run function myguns:raycast
execute anchored feet positioned ^ ^ ^1.0 run function myguns:raycast

say [DEBUG] fire.mcfunction: end @s

tag @s remove myguns_shooter
execute at @s run kill @e[type=minecraft:arrow,distance=..3,sort=nearest,limit=1]
