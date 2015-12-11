-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Poison Leech
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,35,1);
end;
