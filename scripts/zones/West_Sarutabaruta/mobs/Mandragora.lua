-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Mandragora
-- Note: PH for Tom Tit Tat
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,26,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.TOM_TIT_TAT_PH,7,math.random(3600,7200)); -- 1 to 2 hours
end;
