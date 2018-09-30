-----------------------------------
-- Area: Giddeus (145)
--  MOB: Yagudo_Piper
-----------------------------------
local ID = require("scripts/zones/Giddeus/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.VUU_PUQU_THE_BEGUILER_PH,5,math.random(7200,14400)); -- 2 to 4 hours
end;
