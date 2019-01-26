-----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Bigclaw
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 807, 2, dsp.regime.type.GROUNDS)
end