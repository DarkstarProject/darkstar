-----------------------------------
-- Area: Qufim Island
--  MOB: Clipper
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,41,1);
    checkRegime(player,mob,42,1);
    checkRegime(player,mob,43,2);
end;
