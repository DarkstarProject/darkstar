-----------------------------------
-- Area: West Ronfaure
--  MOB: Orcish Fodder
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,4,1);
end;
