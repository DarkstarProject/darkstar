-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Goblin Conjurer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,645,1);
end;