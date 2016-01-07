-----------------------------------
-- Area: South Gustaberg
--  MOB: Walking Sapling
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,78,2);
end;
