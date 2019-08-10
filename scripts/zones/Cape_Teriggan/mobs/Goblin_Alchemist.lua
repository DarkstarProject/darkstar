-----------------------------------
-- Area: Cape Teriggan
--  Mob: Goblin Alchemist
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 105, 2, dsp.regime.type.FIELDS)
end;
