-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Carnivorous Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,33,1);
    checkRegime(ally,mob,34,2);
end;
