-----------------------------------
-- Area: Beaucedine Glacier (111)
--  MOB: Tundra Tiger
-- Note: PH for Nue, Kirata
-----------------------------------
require("scripts/zones/Beaucedine_Glacier/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,46,1);
    checkRegime(player,mob,47,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,KIRATA_PH,7,math.random(3600,28800)); -- 1 to 8 hours
    phOnDespawn(mob,NUE_PH,7,math.random(3600,7200)); -- 1 to 2 hours
end;
