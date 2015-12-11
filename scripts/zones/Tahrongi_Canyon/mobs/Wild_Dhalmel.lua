-----------------------------------
-- Area: Tahrongi Canyon
--  MOB: Wild Dhalmel
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,96,2);
end;
