-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Fallen Major
-- Note: Place holder Hovering Hotpot
-----------------------------------
require("scripts/zones/Garlaige_Citadel/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,703,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,HOVERING_HOTPOT_PH,20,math.random(1800,3600)); -- 30 to 60 minutes
end;
