-----------------------------------
-- Area: South Gustaberg
--  MOB: Stone Eater
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,77,1);
end;
