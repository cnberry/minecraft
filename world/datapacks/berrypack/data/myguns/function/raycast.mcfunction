# === DEBUG: Print scan tip and entities at each main and alternate Y step ===

# Center scan tip
execute at @s run say [DEBUG] scan tip at ~ ~ ~
execute as @e[type=#minecraft:living] at @s run say [DEBUG] all entity @s at ~ ~ ~
execute at @s run say [DEBUG] Entities here: @e[type=#minecraft:living,distance=..15]

# ABOVE the scan tip (head-height)
execute at @s positioned ^ ^1.5 ^0 run say [DEBUG] scan tip AT HEAD at ~ ~ ~
execute as @e[type=#minecraft:living] at @s positioned ^ ^1.5 ^0 run say [DEBUG] all entity (HEAD) @s at ~ ~ ~
execute at @s positioned ^ ^1.5 ^0 run say [DEBUG] Entities here (HEAD): @e[type=#minecraft:living,distance=..15]

# BELOW the scan tip (feet-height)
execute at @s positioned ^ ^-1.5 ^0 run say [DEBUG] scan tip AT FEET at ~ ~ ~
execute as @e[type=#minecraft:living] at @s positioned ^ ^-1.5 ^0 run say [DEBUG] all entity (FEET) @s at ~ ~ ~
execute at @s positioned ^ ^-1.5 ^0 run say [DEBUG] Entities here (FEET): @e[type=#minecraft:living,distance=..15]

# Prove selectors work: check near the player's own feet with wide selector
execute at @s run say [DEBUG] Entities at player: @e[type=#minecraft:living,distance=..1]

particle minecraft:explosion ~ ~ ~ 0 0 0 0 1 force @s

execute at @s if entity @e[type=#minecraft:living,tag=!myguns_shooter,distance=..15,sort=nearest,limit=1] run say [DEBUG] raycast.mcfunction: detected entity in 15 blocks, running function raycast_hit
execute as @e[type=#minecraft:living,tag=!myguns_shooter,distance=..15,sort=nearest,limit=1] at @s run say [DEBUG] raycast.mcfunction: entity found at ray tip, running function raycast_hit
execute as @e[type=#minecraft:living,tag=!myguns_shooter,distance=..15,sort=nearest,limit=1] at @s run function myguns:raycast_hit

execute unless score @s myguns_raycast_steps matches 1.. run say [DEBUG] raycast.mcfunction: finishing, reset raycast_steps
execute unless score @s myguns_raycast_steps matches 1.. run scoreboard players set @s myguns_raycast_steps 0

execute if score @s myguns_raycast_steps matches 1.. run say [DEBUG] raycast.mcfunction: stepping one more
execute if score @s myguns_raycast_steps matches 1.. run scoreboard players remove @s myguns_raycast_steps 1
execute if score @s myguns_raycast_steps matches 1.. run say [DEBUG] raycast.mcfunction: recurse
execute if score @s myguns_raycast_steps matches 1.. positioned ^ ^ ^0.5 run function myguns:raycast

say [DEBUG] raycast.mcfunction: end @s ~ ~ ~
