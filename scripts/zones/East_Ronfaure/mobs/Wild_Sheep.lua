-----------------------------------
-- Area: East Ronfaure
--  MOB: Wild Sheep
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,68,1);
end;
