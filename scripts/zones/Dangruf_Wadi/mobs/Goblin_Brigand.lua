-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Brigand
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,640,1);
    checkGoVregime(ally,mob,642,2);
end;