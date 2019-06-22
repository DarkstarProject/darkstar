-----------------------------------
-- Area: Beaucedine Glacier (111)
--  MOB: Stone_Golem
-- Note: PH for Gargantua
-----------------------------------
local ID = require("scripts/zones/Beaucedine_Glacier/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.GARGANTUA_PH,5,math.random(3600,25200)); -- 1 to 7 hours
end;
