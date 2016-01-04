-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Diving Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,40,2);
end;
