-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Hill Lizard
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,40,1);
end;
