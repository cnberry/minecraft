tag @s add myguns_shooter
scoreboard players set @s myguns_raycast_steps 80
title @s actionbar {"text":"Gun fired","color":"yellow"}

execute anchored eyes positioned ^ ^ ^0.5 run function myguns:raycast

tag @s remove myguns_shooter
execute at @s run kill @e[type=minecraft:arrow,distance=..3,sort=nearest,limit=1]

