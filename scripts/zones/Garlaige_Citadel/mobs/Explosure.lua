-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Explosure
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,706,2);
end;