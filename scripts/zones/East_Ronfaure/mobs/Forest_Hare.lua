-----------------------------------
-- Area: East Ronfaure
--  MOB: Forest Hare
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,66,1);
end;
