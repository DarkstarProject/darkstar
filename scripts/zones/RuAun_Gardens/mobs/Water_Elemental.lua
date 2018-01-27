-----------------------------------
-- Area: RuAun Gardens
--  MOB: Water Elemental
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,146,3);
end;
