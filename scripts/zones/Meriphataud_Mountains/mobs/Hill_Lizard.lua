-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Hill Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,37,1);
    checkRegime(ally,mob,38,2);
end;
