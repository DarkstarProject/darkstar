-----------------------------------
-- Area: East Ronfaure
--  MOB: Scarab Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,68,2);
end;
