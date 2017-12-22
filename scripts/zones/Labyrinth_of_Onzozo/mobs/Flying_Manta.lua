-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Flying Manta
-- Note: Place holder Lord of Onzozo
-----------------------------------
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,774,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,LORD_OF_ONZOZO_PH,4,math.random(75600,86400)); -- 18 to 24 hours
    phOnDespawn(mob,PEG_POWLER_PH,4,math.random(7200,57600)); -- 2 to 16 hours
end;
