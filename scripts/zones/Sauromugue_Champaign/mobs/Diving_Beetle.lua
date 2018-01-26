-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Diving Beetle
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,40,2);
end;
