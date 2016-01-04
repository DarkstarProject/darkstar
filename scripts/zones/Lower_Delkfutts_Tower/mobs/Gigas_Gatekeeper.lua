-----------------------------------
-- Area: Lower Delkfutt's Tower
--  MOB: Gigas Gatekeeper
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,778,2);
end;