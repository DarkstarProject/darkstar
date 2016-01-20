-----------------------------------
-- Area: North Gustaberg
--  MOB: Ornery Sheep
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,59,2);
end;
