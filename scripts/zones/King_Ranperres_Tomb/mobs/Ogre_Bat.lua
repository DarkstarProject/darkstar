-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Ogre Bat
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 638, 2, dsp.regime.type.GROUNDS)
end;