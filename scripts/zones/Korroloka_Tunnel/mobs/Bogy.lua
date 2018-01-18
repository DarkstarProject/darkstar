-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Bogy
-- Note: PH for Dame Blanche
-----------------------------------
require("scripts/zones/Korroloka_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,732,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,DAME_BLANCHE_PH,5,math.random(7200,28800)); -- 2 to 8 hours
end;
