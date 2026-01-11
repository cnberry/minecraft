say [DEBUG] raycast_hit.mcfunction: @s ~ ~ ~
tag @e[tag=myguns_last_hit] remove myguns_last_hit
say [DEBUG] raycast_hit.mcfunction: looking for hit entity

execute if entity @e[type=#minecraft:living,tag=!myguns_shooter,distance=..3,sort=nearest,limit=1] run say [DEBUG] raycast_hit.mcfunction: entity found, tagging as myguns_last_hit

tag @e[type=#minecraft:living,tag=!myguns_shooter,distance=..3,sort=nearest] add myguns_last_hit

execute if entity @e[tag=myguns_last_hit,limit=1] run say [DEBUG] raycast_hit.mcfunction: myguns_last_hit tag applied

execute as @e[tag=myguns_last_hit,limit=1] run say [DEBUG] raycast_hit.mcfunction: about to deal damage to @s

execute if entity @e[tag=myguns_last_hit,limit=1] run title @s actionbar {"text":"Hit: ","color":"green","extra":[{"selector":"@e[tag=myguns_last_hit,limit=1]","color":"white"},{"text":"  Damage: 1000 (500 hearts)","color":"red"}]}

execute if entity @e[tag=myguns_last_hit,limit=1] run say [DEBUG] raycast_hit.mcfunction: applying damage
execute if entity @e[tag=myguns_last_hit,limit=1] run damage @e[tag=myguns_last_hit,limit=1] 1000 minecraft:arrow
execute unless entity @e[tag=myguns_last_hit,limit=1] run say [DEBUG] raycast_hit.mcfunction: no valid entity to damage

tag @e[tag=myguns_last_hit] remove myguns_last_hit
scoreboard players set @s myguns_raycast_steps 0
say [DEBUG] raycast_hit.mcfunction: end of hit handling
