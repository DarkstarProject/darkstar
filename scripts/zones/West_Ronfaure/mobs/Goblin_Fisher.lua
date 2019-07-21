-----------------------------------
-- Area: West Ronfaure
--  Mob: Goblin Fisher
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 56, 2, dsp.regime.type.FIELDS)
end
