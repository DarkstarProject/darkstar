-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Chamber Beetle
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,707,2);
end;