-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Borer Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,704,2);
end;