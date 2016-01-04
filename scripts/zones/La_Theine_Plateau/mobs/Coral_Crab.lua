-----------------------------------
-- Area: La Theine Plateau
--  MOB: Coral Crab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,70,2);
end;
