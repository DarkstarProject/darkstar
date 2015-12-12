-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Bat Eye
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,48,1);
    checkRegime(ally,mob,49,2);
    checkRegime(ally,mob,50,3);
end;
