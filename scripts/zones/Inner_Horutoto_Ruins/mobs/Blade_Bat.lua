-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Blade Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,648,1);
end;