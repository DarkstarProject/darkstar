-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Yagudo Herald
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,99,2);
end;
