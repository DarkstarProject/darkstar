-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Mouse Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 631, 1, dsp.regime.type.GROUNDS)
end;