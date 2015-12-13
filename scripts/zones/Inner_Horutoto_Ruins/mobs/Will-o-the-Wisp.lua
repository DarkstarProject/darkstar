-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Will-o-the-Wisp
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,650,2);
end;