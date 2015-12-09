-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Mighty Rarab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,32,2);
end;
