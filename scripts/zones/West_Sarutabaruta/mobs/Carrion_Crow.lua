-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Carrion Crow
-- Note: PH for Nunyenunc
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,28,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.NUNYENUNC_PH,10,math.random(7200,10800)); -- 2 to 3 hours
end;
