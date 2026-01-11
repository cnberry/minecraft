particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force @s

execute if entity @e[type=#minecraft:living,tag=!myguns_shooter,distance=..1.5,sort=nearest,limit=1] run function myguns:raycast_hit

execute unless score @s myguns_raycast_steps matches 1.. run scoreboard players set @s myguns_raycast_steps 0

execute if score @s myguns_raycast_steps matches 1.. run scoreboard players remove @s myguns_raycast_steps 1
execute if score @s myguns_raycast_steps matches 1.. positioned ^ ^ ^0.5 run function myguns:raycast

