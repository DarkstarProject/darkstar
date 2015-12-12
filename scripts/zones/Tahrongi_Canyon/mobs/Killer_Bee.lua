-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Killer Bee
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,30,2);
    checkRegime(ally,mob,95,2);
end;
