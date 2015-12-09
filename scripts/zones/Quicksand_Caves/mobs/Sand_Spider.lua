-----------------------------------
-- Area: Quicksand Caves
--  MOB: Sand Spider
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,812,1);
end;