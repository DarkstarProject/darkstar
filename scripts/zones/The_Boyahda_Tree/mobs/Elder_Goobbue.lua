-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Elder Goobbue
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,722,2);
end;