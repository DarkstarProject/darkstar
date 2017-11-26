-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Dark_Aspic
-- Note: PH for Sewer Syrup
-----------------------------------
require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,610,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,SEWER_SYRUP_PH,10,math.random(7200,14400)); -- 2 to 4 hours
end;
