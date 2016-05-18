-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Robber
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,764,3);
    checkGoVregime(player,mob,765,3);
end;