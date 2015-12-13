-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Siege Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,704,1);
end;