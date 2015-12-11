-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Rock Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,639,2);
end;
