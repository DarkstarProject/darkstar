-----------------------------------
-- Area: East Ronfaure
--  MOB: Orcish Fodder
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,67,1);
end;
