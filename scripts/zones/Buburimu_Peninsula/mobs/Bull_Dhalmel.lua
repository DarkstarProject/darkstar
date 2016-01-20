-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Bull Dhalmel
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,34,1);
    checkRegime(ally,mob,35,2);
end;
