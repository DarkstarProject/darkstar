-----------------------------------
-- Area: Yughott Grotto (142)
--  MOB: Orcish_Grunt
-- Note: PH for Ashmaker Gotblut
-----------------------------------
local ID = require("scripts/zones/Yughott_Grotto/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.ASHMAKER_GOTBLUT_PH,5,math.random(7200,10800)); -- 2 to 3 hours
end;
