-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Boggart
-- Note: Place holder Nocuous Weapon
-----------------------------------
require("scripts/zones/Inner_Horutoto_Ruins/MobIDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,650,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,NOCUOUS_WEAPON_PH,5,3600); -- 1 hour
end;
