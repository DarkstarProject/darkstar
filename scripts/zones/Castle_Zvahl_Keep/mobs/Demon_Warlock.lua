-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  MOB: Demon_Warlock
-- Note: PH for Viscount Morax
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Keep/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.VISCOUNT_MORAX_PH,10,math.random(3600,28800)); -- 1 to 8 hours
end;
