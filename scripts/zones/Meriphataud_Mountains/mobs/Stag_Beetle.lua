-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Stag Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,38,1);
    checkRegime(ally,mob,39,2);
end;
