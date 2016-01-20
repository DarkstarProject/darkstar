-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Wadi Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,641,2);
end;