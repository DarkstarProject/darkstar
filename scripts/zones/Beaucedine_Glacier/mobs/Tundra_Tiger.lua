-----------------------------------
-- Area: Beaucedine Glacier (111)
--  Mob: Tundra Tiger
-- Note: PH for Nue, Kirata
-----------------------------------
local ID = require("scripts/zones/Beaucedine_Glacier/IDs");
require("scripts/globals/regimes")
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 46, 1, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 47, 1, dsp.regime.type.FIELDS)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.KIRATA_PH,7,math.random(3600,28800)); -- 1 to 8 hours
    dsp.mob.phOnDespawn(mob,ID.mob.NUE_PH,7,math.random(3600,7200)); -- 1 to 2 hours
end;
