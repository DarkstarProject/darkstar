-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Haunt
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,736,2);
end;