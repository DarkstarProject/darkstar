-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Garm
-- Note: PH for Shii
-----------------------------------
require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,612,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,SHII_PH,5,math.random(14400,28800)); -- 4 to 8 hours
end;
