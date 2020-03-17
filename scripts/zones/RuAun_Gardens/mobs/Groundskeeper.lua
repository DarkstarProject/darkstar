-----------------------------------
-- Area: RuAun Gardens
--  Mob: Groundskeeper
-- Note: Place holder Despot
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs");
require("scripts/globals/regimes")
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    tpz.regime.checkRegime(player, mob, 143, 2, tpz.regime.type.FIELDS)
    tpz.regime.checkRegime(player, mob, 144, 1, tpz.regime.type.FIELDS)
end;

function onMobDespawn(mob)
    tpz.mob.phOnDespawn(mob,ID.mob.DESPOT_PH,5,7200); -- 2 hours
end;
