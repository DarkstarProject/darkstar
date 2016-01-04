-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Combat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,728,2);
end;