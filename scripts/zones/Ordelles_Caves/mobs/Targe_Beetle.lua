-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Targe Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,661,2);
end;