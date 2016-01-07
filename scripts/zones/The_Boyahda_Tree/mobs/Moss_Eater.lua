-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Moss Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,721,2);
end;