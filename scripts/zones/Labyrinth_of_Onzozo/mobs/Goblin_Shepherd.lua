-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Goblin Shepherd
-- Note: Place holder Soulstealer Skullnix
-----------------------------------
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,771,2);
    checkGoVregime(player,mob,772,2);
    checkGoVregime(player,mob,774,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,SOULSTEALER_SKULLNIX_PH,5,math.random(7200,10800)); -- 2 to 3 hours
end;
