-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Bushwhacker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,640,1);
    checkGoVregime(ally,mob,645,3);
end;