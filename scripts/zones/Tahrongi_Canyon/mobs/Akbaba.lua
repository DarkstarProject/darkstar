-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Akbaba
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,31,1);
end;
