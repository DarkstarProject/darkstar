-----------------------------------
-- Area: South Gustaberg
--  MOB: Stone Crab
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,80,2);
end;
