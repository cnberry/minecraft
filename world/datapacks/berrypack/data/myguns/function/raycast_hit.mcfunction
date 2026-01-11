tag @e[tag=myguns_last_hit] remove myguns_last_hit
tag @e[type=#minecraft:living,tag=!myguns_shooter,distance=..1.5,sort=nearest,limit=1] add myguns_last_hit

execute if entity @e[tag=myguns_last_hit,limit=1] run title @s actionbar {"text":"Hit: ","color":"green","extra":[{"selector":"@e[tag=myguns_last_hit,limit=1]","color":"white"},{"text":"  Damage: 1000 (500 hearts)","color":"red"}]}
execute if entity @e[tag=myguns_last_hit,limit=1] run damage @e[tag=myguns_last_hit,limit=1] 1000 minecraft:arrow

tag @e[tag=myguns_last_hit] remove myguns_last_hit
scoreboard players set @s myguns_raycast_steps 0

