-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Sauromugue Skink
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,97,1);
    checkRegime(ally,mob,99,1);
end;
