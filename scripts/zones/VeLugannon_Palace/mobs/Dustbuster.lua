-----------------------------------
-- Area: Ve'Lugannon Palace
--  MOB: Dustbuster
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,743,1);
    checkGoVregime(ally,mob,745,1);
end;