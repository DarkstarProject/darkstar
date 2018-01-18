-----------------------------------
-- Area: South Gustaberg
--  MOB: Rock Lizard
-- Note: Place holder Leaping Lizzy
-----------------------------------
require("scripts/zones/South_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,80,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,LEAPING_LIZZY_PH,5,3600); -- 1 hour
end;
