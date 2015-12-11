-----------------------------------
-- Area: North Gustaberg
--  MOB: Rock Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,19,2);
end;
