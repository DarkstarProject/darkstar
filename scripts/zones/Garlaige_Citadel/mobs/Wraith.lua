-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Wraith
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,708,3);
end;