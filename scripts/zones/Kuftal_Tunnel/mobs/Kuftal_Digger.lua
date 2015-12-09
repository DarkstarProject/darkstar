-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Kuftal Digger
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,739,1);
end;