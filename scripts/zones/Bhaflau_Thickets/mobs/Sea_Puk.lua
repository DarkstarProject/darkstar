-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Sea Puk
-- Note: Place holder Nis Puk
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,NIS_PUK_PH,5,43200); -- 12 hours
end;
