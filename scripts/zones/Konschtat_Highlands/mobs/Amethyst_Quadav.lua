-----------------------------------
-- Area: Konschtat Highlands
--  MOB: Amethyst Quadav
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 83, 1, dsp.regime.type.FIELDS)
end;
