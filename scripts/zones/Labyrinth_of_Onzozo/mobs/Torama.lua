-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Torama
-- Note: Place holder Ose
-----------------------------------
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,775,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,OSE_PH,5,3600); -- 1 hour
end;
