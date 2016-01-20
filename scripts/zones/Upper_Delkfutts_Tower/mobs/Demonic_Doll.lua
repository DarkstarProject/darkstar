-----------------------------------
-- Area: Upper Delkfutt's Tower
--  MOB: Demonic Doll
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,788,3);
    checkGoVregime(ally,mob,789,3);
end;