-----------------------------------
-- Area: East Ronfaure
--  MOB: Mud Pugil
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,64,1);
end;
