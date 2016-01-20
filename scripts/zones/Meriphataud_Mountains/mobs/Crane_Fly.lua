-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Crane Fly
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,36,1);
    checkRegime(ally,mob,37,2);
end;
