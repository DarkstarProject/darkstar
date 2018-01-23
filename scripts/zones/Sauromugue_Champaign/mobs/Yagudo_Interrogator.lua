-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Yagudo Interrogator
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,99,2);
end;
