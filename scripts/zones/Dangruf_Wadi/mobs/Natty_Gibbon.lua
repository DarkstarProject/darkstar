-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Natty Gibbon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,646,2);
end;