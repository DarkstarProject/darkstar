-----------------------------------
-- Area: West Ronfaure
--  MOB: Wild Sheep
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,56,1);
end;
