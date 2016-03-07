-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Skinnymajinx
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,654,2);
end;