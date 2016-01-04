-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Shrieker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,656,2);
end;