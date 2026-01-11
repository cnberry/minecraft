tag @s add myguns_processed

# Unmissable debug signals
say [Gun] bullet_hit_entity
summon minecraft:lightning_bolt ~ ~ ~
playsound minecraft:entity.lightning_bolt.thunder master @a ~ ~ ~ 1 1

# 500 hearts = 1000 damage
damage @e[type=#minecraft:living,distance=..1.8,sort=nearest,limit=1] 1000 minecraft:arrow

kill @s

