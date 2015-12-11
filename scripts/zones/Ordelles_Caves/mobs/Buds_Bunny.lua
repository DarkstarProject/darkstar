-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Buds Bunny
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,661,1);
end;