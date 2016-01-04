-----------------------------------
-- Area: South Gustaberg
--  MOB: Goblin Weaver
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,79,1);
end;
