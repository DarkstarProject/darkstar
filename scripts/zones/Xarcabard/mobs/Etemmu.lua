-----------------------------------
-- Area: Xarcabard
--  MOB: Etemmu
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,51,2);
end;
