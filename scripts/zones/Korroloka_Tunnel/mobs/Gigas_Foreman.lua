-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Gigas Foreman
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,733,1);
end;