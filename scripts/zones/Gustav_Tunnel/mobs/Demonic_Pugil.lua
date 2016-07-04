-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Demonic Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,766,2);
end;