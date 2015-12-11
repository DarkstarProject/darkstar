-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Lost Soul
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,103,2);
end;
