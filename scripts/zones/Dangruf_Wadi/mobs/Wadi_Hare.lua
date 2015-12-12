-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Wadi Hare
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,641,1);
end;