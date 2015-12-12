-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Seeker Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,727,2);
    checkGoVregime(ally,mob,728,1);
end;