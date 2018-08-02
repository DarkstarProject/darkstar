-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Flying Manta
-- Note: Place holder Lord of Onzozo
-----------------------------------
local ID = require("scripts/zones/Labyrinth_of_Onzozo/IDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,774,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.LORD_OF_ONZOZO_PH,4,math.random(75600,86400)); -- 18 to 24 hours
    phOnDespawn(mob,ID.mob.PEG_POWLER_PH,4,math.random(7200,57600)); -- 2 to 16 hours
end;
