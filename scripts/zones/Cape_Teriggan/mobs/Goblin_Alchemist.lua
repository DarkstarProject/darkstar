-----------------------------------
-- Area: Cape Teriggan
--  MOB: Goblin Alchemist
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,105,2);
end;
