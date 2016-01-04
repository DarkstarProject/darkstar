-----------------------------------
-- Area: Valley of Sorrows
--  MOB: Valley Manticore
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,140,2);
    checkRegime(ally,mob,141,2);
end;
