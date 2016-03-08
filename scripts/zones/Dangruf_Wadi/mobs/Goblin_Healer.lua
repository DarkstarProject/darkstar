-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Healer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,640,1);
    checkGoVregime(ally,mob,644,2);
end;