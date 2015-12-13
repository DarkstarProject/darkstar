-----------------------------------
-- Area: South Gustaberg
--  MOB: Passage Crab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,80,2);
end;
