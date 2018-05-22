-----------------------------------
-- Area: Sea Serpent Grotto (176)
--  MOB: Devil Manta
-- Note: Place holder Charybdis
-----------------------------------
require("scripts/globals/groundsofvalor")
require("scripts/globals/mobs")
require("scripts/zones/Sea_Serpent_Grotto/MobIDs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,810,2)
end

function onMobDespawn(mob)
    phOnDespawn(mob,CHARYBDIS_PH,10,math.random(28800,43200)) -- 8 - 12 hours
end