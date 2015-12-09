-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Goblin Trader
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,46,2);
    checkRegime(ally,mob,49,1);
    checkRegime(ally,mob,50,2);
end;
