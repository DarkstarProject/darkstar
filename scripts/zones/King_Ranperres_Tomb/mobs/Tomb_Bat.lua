-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Tomb Bat
-- Note: Place holder Crypt Ghost
-----------------------------------
require("scripts/zones/King_Ranperres_Tomb/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,CRYPT_GHOST_PH,5,3600); -- 1 hour
end;
