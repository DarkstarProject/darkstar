-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Goblin Leecher
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,657,1);
end;