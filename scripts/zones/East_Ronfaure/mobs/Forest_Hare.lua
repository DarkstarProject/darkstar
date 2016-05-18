-----------------------------------
-- Area: East Ronfaure
--  MOB: Forest Hare
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,66,1);
end;
