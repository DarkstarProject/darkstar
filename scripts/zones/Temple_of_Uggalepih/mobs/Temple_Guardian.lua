-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Temple Guardian
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs");

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(ID.npc.TEMPLE_GUARDIAN_DOOR):openDoor(300); -- 5min
end;