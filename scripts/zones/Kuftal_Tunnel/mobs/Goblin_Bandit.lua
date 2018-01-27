-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Goblin Bandit
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,740,2);
end;