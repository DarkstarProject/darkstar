-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fortalice Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,710,1);
end;