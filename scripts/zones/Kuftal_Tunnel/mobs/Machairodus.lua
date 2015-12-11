-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Machairodus
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,742,2);
end;