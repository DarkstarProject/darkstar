-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Weaver
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,640,1);
end;
