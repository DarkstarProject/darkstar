-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Carnivorous Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,23,1);
    checkRegime(ally,mob,24,2);
end;
