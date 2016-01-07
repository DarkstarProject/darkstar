-----------------------------------
-- Area: The Boyahda Tree
--  MOB: Viseclaw
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,726,1);
end;