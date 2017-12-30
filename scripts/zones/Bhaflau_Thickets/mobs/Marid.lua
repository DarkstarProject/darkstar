-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Marid
-- Note: Place holder Mahishasura
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,MAHISHASURA_PH,5,10800); -- 3 hours
end;
