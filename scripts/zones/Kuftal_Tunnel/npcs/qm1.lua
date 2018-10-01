-----------------------------------
-- Area: Kuftal Tunnel
--  NPC: ??? (qm1)
-- Note: Spawns Phantom Worm
-- position changes every 5 seconds
-----------------------------------
require("scripts/zones/Kuftal_Tunnel/globals");
local ID = require("scripts/zones/Kuftal_Tunnel/IDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)
    npc:timer(5000, function(npc) KUFTAL_TUNNEL.movePhantomWormQM(); end);
end;

function onTrade(player,npc,trade)
    if (not GetMobByID(ID.mob.PHANTOM_WORM):isSpawned() and npcUtil.tradeHas(trade, 645)) then -- Darksteel Ore
        local x = npc:getXPos();
        local y = npc:getYPos();
        local z = npc:getZPos();
        npc:setStatus(dsp.status.DISAPPEAR);
        player:confirmTrade();
        SpawnMob(ID.mob.PHANTOM_WORM):updateClaim(player);
        GetMobByID(ID.mob.PHANTOM_WORM):setPos(x+1,y,z+1);
    end
end;

function onTrigger(player,npc)
end;
