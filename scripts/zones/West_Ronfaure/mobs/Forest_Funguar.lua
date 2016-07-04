-----------------------------------
-- Area: West Ronfaure
--  MOB: Forest Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,3,2);
end;
