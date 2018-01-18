----------------------------------
-- Area: Gustav Tunnel
--  MOB: Typhoon Wyvern
-- Note: Place holder Ungur
-----------------------------------
require("scripts/zones/Gustav_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,769,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,UNGUR_PH,5,7200); -- 2 hours
end;
