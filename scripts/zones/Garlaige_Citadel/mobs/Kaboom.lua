-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Kaboom
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,709,2);
end;