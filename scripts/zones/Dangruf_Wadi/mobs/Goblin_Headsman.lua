-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Headsman
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,640,1);
    checkGoVregime(ally,mob,643,2);
end;