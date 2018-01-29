-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Killer Bee
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,30,2);
    checkRegime(player,mob,95,2);
end;
