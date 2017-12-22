-----------------------------------
-- Area: North Gustaberg
--  MOB: Maneating Hornet
-- Note: Place Holder For Stinging Sophie
-----------------------------------
require("scripts/zones/North_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,17,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,STINGING_SOPHIE_PH,5,math.random(1200,3600)); -- 20 to 60 minutes
end;
