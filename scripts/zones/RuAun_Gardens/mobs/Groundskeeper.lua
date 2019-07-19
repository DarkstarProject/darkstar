-----------------------------------
-- Area: RuAun Gardens
--  Mob: Groundskeeper
-- Note: Place holder Despot
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs");
require("scripts/globals/regimes")
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 143, 2, dsp.regime.type.FIELDS)
    dsp.regime.checkRegime(player, mob, 144, 1, dsp.regime.type.FIELDS)
end;

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob,ID.mob.DESPOT_PH,5,7200); -- 2 hours
end;
