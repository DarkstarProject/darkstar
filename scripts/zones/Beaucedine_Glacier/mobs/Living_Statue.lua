-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Living Statue
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,47,2);
    checkRegime(ally,mob,48,2);
    checkRegime(ally,mob,49,3);
end;
