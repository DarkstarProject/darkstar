-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Vorpal Bunny
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,658,2);
end;