-----------------------------------
-- Area: East Ronfaure
--  MOB: Forest Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,67,2);
end;
