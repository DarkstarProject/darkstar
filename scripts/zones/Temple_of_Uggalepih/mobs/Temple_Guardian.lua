-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Temple Guardian
-----------------------------------
require("scripts/zones/Temple_of_Uggalepih/MobIDs");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(TEMPLE_GUARDIAN_DOOR):openDoor(300); -- 5min
end;