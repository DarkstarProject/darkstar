-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Champaign Coeurl
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,98,1);
end;
