-----------------------------------
-- Area: East Ronfaure
--  MOB: Cheval Pugil
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,64,1);
end;
