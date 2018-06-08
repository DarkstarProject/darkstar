-----------------------------------
-- Area: Valley of Sorrows
--  MOB: Valley Manticore
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,140,2);
    checkRegime(player,mob,141,2);
end;
