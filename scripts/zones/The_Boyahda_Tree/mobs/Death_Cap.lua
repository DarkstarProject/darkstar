-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Death Cap
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,719,1);
end;