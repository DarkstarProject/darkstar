-----------------------------------
-- Area: Qufim Island
--  MOB: Giant Ranger
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,44,1);
    checkRegime(player,mob,45,2);
end;
