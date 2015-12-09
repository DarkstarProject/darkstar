-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Tsaagan
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,39,1);
end;
