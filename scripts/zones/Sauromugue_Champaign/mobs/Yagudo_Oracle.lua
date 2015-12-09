-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Yagudo Oracle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,99,2);
end;
