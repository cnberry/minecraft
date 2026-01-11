# Tag the nearest arrow created near the shooter as a bullet
execute at @s run tag @e[type=minecraft:arrow,distance=..3,sort=nearest,limit=1,tag=!myguns_bullet] add myguns_bullet

