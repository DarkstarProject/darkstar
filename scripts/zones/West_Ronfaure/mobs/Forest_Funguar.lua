-----------------------------------
-- Area: West Ronfaure
--  MOB: Forest Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,3,2);
end;
