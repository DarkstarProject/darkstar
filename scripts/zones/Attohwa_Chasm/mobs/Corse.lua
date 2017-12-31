-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Corse
-- Note: PH for Citipati
-----------------------------------
require("scripts/zones/Attohwa_Chasm/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,CITIPATI_PH,20,math.random(10800,21600)); -- 3 to 6 hours
end;
