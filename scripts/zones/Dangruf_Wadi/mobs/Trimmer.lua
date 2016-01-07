-----------------------------------
-- Area: Dangruf Wadi
--  MOB: Trimmer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,646,1);
end;