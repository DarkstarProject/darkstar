-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Blighting Brand
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,100,2);
end;
