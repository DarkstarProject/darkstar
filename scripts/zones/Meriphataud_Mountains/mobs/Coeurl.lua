-----------------------------------
-- Area: Meriphataud Mountains
--  MOB: Coeurl
-- Note: PH for Patripatan
-----------------------------------
require("scripts/zones/Meriphataud_Mountains/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,63,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,PATRIPATAN_PH,5,math.random(3600,10800)); -- 1 to 3 hours
end;
