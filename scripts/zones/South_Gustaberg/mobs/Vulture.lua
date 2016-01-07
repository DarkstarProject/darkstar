-----------------------------------
-- Area: South Gustaberg
--  MOB: Vulture
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,78,1);
end;
