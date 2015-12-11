-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Hawker
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,764,1);
end;