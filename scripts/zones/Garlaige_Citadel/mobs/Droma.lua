-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Droma
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,707,1);
end;