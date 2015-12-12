-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Goblin Leecher
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,62,2);
end;
