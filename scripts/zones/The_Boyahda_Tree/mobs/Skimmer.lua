-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Skimmer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,723,1);
end;