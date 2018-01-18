-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Tainted Flesh
-- Note: Place holder Hellion
-----------------------------------
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,HELLION_PH,5,math.random(7200,14400)); -- 2 to 4 hours
end;
