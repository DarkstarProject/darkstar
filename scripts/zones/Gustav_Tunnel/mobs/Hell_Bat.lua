-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Hell Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,763,3);
end;