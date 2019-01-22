-----------------------------------
-- Area: Oldton Movalpolos
--  MOB: Goblin Wolfman
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    local npc = GetNPCByID(ID.npc.SCRAWLED_WRITING);
        switch (math.random(1,3)): caseof
        {
            [1] = function (x) npc:setPos(-16.806, 7.718, 14.155); end,
            [2] = function (x) npc:setPos(-18.0, 12.0, -115.0); end, --approximate retail position 
            [3] = function (x) npc:setPos(-150.0, 8.0, -252.0); end, --approximate retial position
        }
    npc:updateNPCHideTime(900); --15 minute until unhide
end;
