-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Spartoi Sorcerer
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 638, 1, dsp.regime.type.GROUNDS)
end;