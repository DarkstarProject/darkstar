-----------------------------------
-- Area: South Gustaberg
--  MOB: Huge Hornet
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,76,1);
end;
