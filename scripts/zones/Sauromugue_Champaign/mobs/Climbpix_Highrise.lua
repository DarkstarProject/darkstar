-----------------------------------
-- Area: Sauromugue Champaign
-- NM:   Climbpix Highrise
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,97,2);
    checkRegime(ally,mob,98,2);
end;
