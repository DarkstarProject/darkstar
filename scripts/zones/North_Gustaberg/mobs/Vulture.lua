-----------------------------------
-- Area: North Gustaberg
--  MOB: Vulture
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,18,1);
end;
