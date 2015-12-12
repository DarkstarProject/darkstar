-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Azer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,673,2);
end;