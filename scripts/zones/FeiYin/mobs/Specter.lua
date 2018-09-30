-----------------------------------
-- Area: Fei'Yin
--  MOB: Specter
-- Note: PH for N/E/S/W Shadow NMs
-----------------------------------
require("scripts/globals/groundsofvalor");
local ID = require("scripts/zones/FeiYin/IDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,712,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.NORTHERN_SHADOW_PH,5,57600); -- 16 hours
    phOnDespawn(mob,ID.mob.EASTERN_SHADOW_PH,5,36000); -- 10 hours
    phOnDespawn(mob,ID.mob.WESTERN_SHADOW_PH,5,36000); -- 10 hours
    phOnDespawn(mob,ID.mob.SOUTHERN_SHADOW_PH,5,57600); -- 16 hours
end;
