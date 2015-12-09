-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goliath Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,660,1);
end;