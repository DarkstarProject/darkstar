-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Donjon Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,709,1);
end;