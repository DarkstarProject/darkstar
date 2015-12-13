-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Thread Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,730,1);
end;