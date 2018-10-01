-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Ochu
-- Note: PH for Drooling Daisy
-----------------------------------
local ID = require("scripts/zones/Rolanberry_Fields/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,88,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.DROOLING_DAISY_PH,10,3600); -- 1 hour
end;
