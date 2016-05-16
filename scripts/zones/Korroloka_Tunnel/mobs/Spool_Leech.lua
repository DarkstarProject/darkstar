-----------------------------------
-- Area: Korroloka Tunnel
--  MOB: Spool Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,734,2);
end;