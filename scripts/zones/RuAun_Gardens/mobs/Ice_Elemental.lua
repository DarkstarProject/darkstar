-----------------------------------
-- Area: RuAun Gardens
--  MOB: Ice Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,146,1);
end;
