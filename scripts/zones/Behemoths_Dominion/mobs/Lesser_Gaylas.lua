-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Lesser Gaylas
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,101,1);
    checkRegime(ally,mob,102,1);
end;
