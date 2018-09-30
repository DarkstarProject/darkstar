-----------------------------------
-- Area: Castle Oztroja (151)
--  MOB: Yagudo_Lutenist
-----------------------------------
local ID = require("scripts/zones/Castle_Oztroja/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.YAA_HAQA_THE_PROFANE_PH,5,math.random(3600,7200)); -- 1 to 2 hours
end;
