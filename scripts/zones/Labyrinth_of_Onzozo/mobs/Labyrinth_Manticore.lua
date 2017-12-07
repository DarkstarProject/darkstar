-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Labyrinth Manticore
-- Note: Place holder Narasimha
-----------------------------------
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,775,2);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,NARASIMHA_PH,5,math.random(21600,36000)); -- 6 to 10 hours
end;
