-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Herald
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.QUU_DOMI_THE_GALLANT_PH,5,math.random(3600,10800)); -- 1 to 3 hours
end;
