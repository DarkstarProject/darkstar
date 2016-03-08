-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Bladesmith
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,640,1);
    checkGoVregime(ally,mob,645,2);
end;