-----------------------------------
-- Area: South Gustaberg
--  MOB: Walking Sapling
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,78,2);
end;
