-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Clipper
-- Note: PH for Cargo Crab Colin
-----------------------------------
require("scripts/zones/Korroloka_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,731,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,CARGO_CRAB_COLIN_PH,5,math.random(7200,21600)); -- 1 to 6 hours
end;
