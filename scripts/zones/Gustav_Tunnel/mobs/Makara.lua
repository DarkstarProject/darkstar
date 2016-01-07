-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Makara
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,764,2);
end;