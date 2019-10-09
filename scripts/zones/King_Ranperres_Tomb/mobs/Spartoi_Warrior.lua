-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Spartoi Warrior
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 637, 1, dsp.regime.type.GROUNDS)
end