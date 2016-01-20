-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Jelly
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,729,2);
end;