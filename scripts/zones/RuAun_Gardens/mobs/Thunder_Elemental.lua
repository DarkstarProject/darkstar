-----------------------------------
-- Area: RuAun Gardens
--  MOB: Thunder Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,145,3);
end;
