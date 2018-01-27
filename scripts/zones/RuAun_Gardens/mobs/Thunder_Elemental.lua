-----------------------------------
-- Area: RuAun Gardens
--  MOB: Thunder Elemental
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,145,3);
end;
