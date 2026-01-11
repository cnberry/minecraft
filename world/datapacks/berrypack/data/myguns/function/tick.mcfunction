# Mark who is holding the gun
tag @a remove myguns_holding_gun
execute as @a if items entity @s weapon.mainhand minecraft:bow[minecraft:custom_data={myguns_gun:1}] run tag @s add myguns_holding_gun

# Compute delta = myguns_bow - myguns_bow_last
execute as @a[tag=myguns_holding_gun] run scoreboard players operation @s myguns_bow_delta = @s myguns_bow
execute as @a[tag=myguns_holding_gun] run scoreboard players operation @s myguns_bow_delta -= @s myguns_bow_last

# If delta >= 1, a shot occurred -> fire once
execute as @a[tag=myguns_holding_gun] if score @s myguns_bow_delta matches 1.. run function myguns:fire
execute as @a[tag=myguns_holding_gun] if score @s myguns_bow_delta matches 1.. at @s run particle minecraft:explosion ~ ~1.6 ~ 0.2 0.2 0.2 0 20 force @s
execute as @a[tag=myguns_holding_gun] run title @s actionbar {"text":"delta=","color":"gray","extra":[{"score":{"name":"@s","objective":"myguns_bow_delta"}}]}


# Update last to current
execute as @a[tag=myguns_holding_gun] run scoreboard players operation @s myguns_bow_last = @s myguns_bow

