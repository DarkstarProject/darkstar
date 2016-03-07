-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Robber Crab
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,720,2);
end;