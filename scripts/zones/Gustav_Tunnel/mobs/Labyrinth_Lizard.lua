-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Labyrinth Lizard
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,763,1);
end;