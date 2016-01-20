-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Blob
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,649,2);
end;