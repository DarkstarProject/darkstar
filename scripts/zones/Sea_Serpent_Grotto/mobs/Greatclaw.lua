-----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Greatclaw
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 811, 2, dsp.regime.type.GROUNDS)
end