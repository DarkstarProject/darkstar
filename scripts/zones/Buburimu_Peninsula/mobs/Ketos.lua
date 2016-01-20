-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Ketos
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,62,1);
end;
