-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fallen Officer
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,703,2);
end;