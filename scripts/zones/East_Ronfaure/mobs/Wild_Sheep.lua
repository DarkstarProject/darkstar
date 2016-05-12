-----------------------------------
-- Area: East Ronfaure
--  MOB: Wild Sheep
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,68,1);
end;
