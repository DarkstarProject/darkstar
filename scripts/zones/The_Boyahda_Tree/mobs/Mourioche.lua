-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Mourioche
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,720,1);
    checkGoVregime(ally,mob,721,1);
end;