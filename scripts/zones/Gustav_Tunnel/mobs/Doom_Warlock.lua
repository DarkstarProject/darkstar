----------------------------------
-- Area: Gustav Tunnel
--  MOB: Doom Warlock
-- Note: Place holder Taxim
-----------------------------------
require("scripts/zones/Gustav_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,765,2);
    checkGoVregime(player,mob,766,1);
    checkGoVregime(player,mob,769,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,TAXIM_PH,5,7200); -- 2 hours
end;
