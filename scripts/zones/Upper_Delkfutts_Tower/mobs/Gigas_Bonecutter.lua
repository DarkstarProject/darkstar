-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Gigas Bonecutter
-- Note: PH for Enkelados
-----------------------------------
local ID = require("scripts/zones/Upper_Delkfutts_Tower/IDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,785,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.ENKELADOS_PH,5,1); -- no cooldown
end;
