-----------------------------------
-- Area: Qufim Island
--  MOB: Acrophies
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,45,1);
end;
