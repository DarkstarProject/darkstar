-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Doom Guard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,765,2);
    checkGoVregime(ally,mob,767,1);
    checkGoVregime(ally,mob,768,1);
end;