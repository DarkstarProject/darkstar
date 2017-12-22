-----------------------------------
-- Area: North Gustaberg
--  MOB: Walking Sapling
-- Note: Place Holder For Maighdean Uaine
-----------------------------------
require("scripts/zones/North_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,18,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,MAIGHDEAN_UAINE_PH,5,math.random(900,10800)); -- 15 to 180 minutes
end;
