-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Boggart
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,650,1);
end;