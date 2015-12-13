-----------------------------------
-- Area: Ordelle's Caves
--  MOB: Will-o-the-Wisp
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,657,2);
end;