-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Ochu
-- Note: PH for Drooling Daisy
-----------------------------------
require("scripts/zones/Rolanberry_Fields/MobIDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,88,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,DROOLING_DAISY_PH,10,3600); -- 1 hour
end;
