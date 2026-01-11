# Remove exactly 1 token
clear @s minecraft:paper[minecraft:custom_data={myguns_token:1}] 1

# Give the gun as a bow
give @s minecraft:bow[minecraft:custom_name='{"text":"Custom Gun","italic":false}',minecraft:custom_data={myguns_gun:1}] 1

# Ammo
give @s minecraft:arrow 32

# IMPORTANT: allow the advancement to trigger again next time
advancement revoke @s only myguns:craft_custom_gun

