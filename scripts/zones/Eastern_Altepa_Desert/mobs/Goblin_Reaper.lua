-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Goblin Reaper
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 113, 3, dsp.regime.type.FIELDS)
end;
