-----------------------------------
-- Area: Xarcabard
--  MOB: Demon Warlock
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,55,1);
end;
