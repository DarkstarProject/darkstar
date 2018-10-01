-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Veteran Quadav
-- Note: PH for Ni'Zho Bladebender
-----------------------------------
local ID = require("scripts/zones/Pashhow_Marshlands/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,60,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.NI_ZHO_BLADEBENDER_PH,10,3600); -- 1 hour
end;
