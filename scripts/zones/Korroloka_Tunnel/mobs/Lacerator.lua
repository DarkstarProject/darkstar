-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Lacerator
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,734,1);
end;