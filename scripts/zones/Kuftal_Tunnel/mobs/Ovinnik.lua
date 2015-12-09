-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Ovinnik
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,741,1);
end;