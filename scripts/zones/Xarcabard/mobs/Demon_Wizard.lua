-----------------------------------
-- Area: Xarcabard
--  MOB: Demon Wizard
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,55,1);
end;
