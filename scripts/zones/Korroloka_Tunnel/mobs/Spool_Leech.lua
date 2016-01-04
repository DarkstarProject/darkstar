-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Spool Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,734,2);
end;