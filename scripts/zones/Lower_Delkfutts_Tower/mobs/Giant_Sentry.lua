-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Giant Sentry
-- Note: PH for Hippolytos and Eurymedon
-----------------------------------
require("scripts/zones/Lower_Delkfutts_Tower/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,778,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,HIPPOLYTOS_PH,5,1); -- no cooldown
    phOnDespawn(mob,EURYMEDON_PH,5,1); -- no cooldown
end;
