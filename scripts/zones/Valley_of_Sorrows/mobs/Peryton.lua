-----------------------------------
-- Area: Valley of Sorrows
--  MOB: Peryton
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,139,2);
    checkRegime(ally,mob,141,1);
end;
