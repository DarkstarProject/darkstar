-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Hoarder Hare
-- Note: PH for Teporingo
-----------------------------------
require("scripts/zones/Dangruf_Wadi/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,TEPORINGO_PH,20,3600); -- 1 hour
end;
