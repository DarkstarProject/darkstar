-----------------------------------
-- Area: Cape Teriggan
--  MOB: Sand Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,104,2);
end;
