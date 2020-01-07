-----------------------------------
-- Area: King Ranperres Tomb
--  Mob: Ogre Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 638, 2, dsp.regime.type.GROUNDS)
end