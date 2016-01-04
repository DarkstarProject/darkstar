-----------------------------------
-- Area: North Gustaberg
--  MOB: Stone Eater
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,16,1);
end;
