-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Sylvestre
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,32,1);
    checkRegime(ally,mob,33,2);
end;
