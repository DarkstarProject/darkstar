-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Covin Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,653,1);
end;