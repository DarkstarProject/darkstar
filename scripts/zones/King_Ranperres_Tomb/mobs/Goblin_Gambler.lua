-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Goblin Gambler
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 631, 2, dsp.regime.type.GROUNDS)
    dsp.regime.checkRegime(player, mob, 635, 3, dsp.regime.type.GROUNDS)
end;