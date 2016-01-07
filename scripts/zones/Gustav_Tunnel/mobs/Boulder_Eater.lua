-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Boulder Eater
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,770,1);
end;