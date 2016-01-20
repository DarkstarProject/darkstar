-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Wingrats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,703,1);
end;