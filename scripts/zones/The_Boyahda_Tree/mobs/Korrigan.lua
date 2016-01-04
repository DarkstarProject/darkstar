-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Korrigan
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,722,1);
end;