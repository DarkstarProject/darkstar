-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Skinnymalinks
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,653,2);
end;