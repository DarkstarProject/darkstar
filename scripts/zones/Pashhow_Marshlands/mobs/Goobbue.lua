-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Goobbue
-- Note: PH for Jolly Green
-----------------------------------
require("scripts/zones/Pashhow_Marshlands/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,60,3);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,JOLLY_GREEN_PH,5,1); -- 1 second / no cooldown
end;