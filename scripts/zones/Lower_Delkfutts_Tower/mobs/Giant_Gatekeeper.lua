-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Giant Gatekeeper
-- Note: PH for Epialtes and Hippolytos
-----------------------------------
require("scripts/zones/Lower_Delkfutts_Tower/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,778,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,EPIALTES_PH,5,1); -- no cooldown
    phOnDespawn(mob,HIPPOLYTOS_PH,5,1); -- no cooldown
end;
