-----------------------------------
-- Area: Giddeus (145)
--  MOB: Yagudo_Mendicant
-----------------------------------
require("scripts/zones/Giddeus/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,HOO_MJUU_THE_TORRENT_PH,5,3600); -- 1 hour
end;
