-----------------------------------
-- Area: West Ronfaure(100)
--  MOB: Scarab Beetle
-- Note: Place holder for Fungus Beetle
-----------------------------------
require("scripts/zones/West_Ronfaure/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,3,1);
    checkRegime(player,mob,4,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,FUNGUS_BEETLE_PH,10,math.random(900,10800)); -- 15 minutes to 3 hours
end;
