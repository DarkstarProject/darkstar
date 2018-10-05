-----------------------------------
-- Area: West Ronfaure
--  MOB: Goblin Digger
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 56, 2, dsp.regime.type.FIELDS)
end;
