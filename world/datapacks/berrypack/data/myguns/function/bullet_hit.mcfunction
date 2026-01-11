# Mark who is holding the gun
tag @a remove myguns_holding_gun
execute as @a if items entity @s weapon.mainhand minecraft:bow[minecraft:custom_data={myguns_gun:1}] run tag @s add myguns_holding_gun

# Tag nearest arrow near each gun-holder as a bullet
execute as @a[tag=myguns_holding_gun] at @s run tag @e[type=minecraft:arrow,distance=..4,sort=nearest,limit=1,tag=!myguns_bullet] add myguns_bullet

# Optional: particle trail so you can see bullet arrows
execute as @e[type=minecraft:arrow,tag=myguns_bullet] at @s run particle minecraft:crit ~ ~ ~ 0.05 0.05 0.05 0.001 1

# ────────────────
# BULLET HIT LOGIC
# ────────────────

# A) Bullet hit a living entity (arrow passes through entity hitbox)
execute as @e[type=minecraft:arrow,tag=myguns_bullet,tag=!myguns_processed,nbt={inGround:0b}] at @s if entity @e[type=#minecraft:living,distance=..1.0,sort=nearest,limit=1] run function myguns:bullet_hit_entity

# B) Bullet hit a block (arrow stuck in ground)
execute as @e[type=minecraft:arrow,tag=myguns_bullet,tag=!myguns_processed,nbt={inGround:1b}] at @s run function myguns:bullet_hit_block

