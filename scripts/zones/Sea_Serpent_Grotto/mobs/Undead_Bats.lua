-----------------------------------
-- Area: Sea Serpent Grotto
--  MOB: Undead Bats
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 804, 2, dsp.regime.type.GROUNDS)
end