-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Labyrinth Leech
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,763,2);
end;