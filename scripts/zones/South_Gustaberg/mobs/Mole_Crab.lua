-----------------------------------
-- Area: South Gustaberg
--  MOB: Mole Crab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,80,2);
end;
