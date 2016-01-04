-----------------------------------
-- Area: RuAun Gardens
--  MOB: Fire Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,145,1);
end;
