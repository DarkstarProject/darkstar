-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Gigas Bonecutter
-- Note: PH for Enkelados
-----------------------------------
require("scripts/zones/Upper_Delkfutts_Tower/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,785,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ENKELADOS_PH,5,1); -- no cooldown
end;
