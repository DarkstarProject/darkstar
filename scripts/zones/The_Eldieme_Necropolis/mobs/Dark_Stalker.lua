-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Dark Stalker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,672,1);
    checkGoVregime(ally,mob,673,1);
end;