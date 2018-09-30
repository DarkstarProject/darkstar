-----------------------------------
-- Area: Inner Horutoto Ruins
--  MOB: Boggart
-- Note: Place holder Nocuous Weapon
-----------------------------------
local ID = require("scripts/zones/Inner_Horutoto_Ruins/IDs");
require("scripts/globals/groundsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,650,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.NOCUOUS_WEAPON_PH,5,3600); -- 1 hour
end;
