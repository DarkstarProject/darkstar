-----------------------------------
-- Area: Korroloka Tunnel
--  NPC: ??? (qm1) - Morion Worm spawn
-- !pos 254.652 -6.039 20.878 173
-----------------------------------
package.loaded["scripts/zones/Korroloka_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Korroloka_Tunnel/globals");
require("scripts/zones/Korroloka_Tunnel/TextIDs");
require("scripts/zones/Korroloka_Tunnel/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)
    npc:timer(900000, function(npc) KORROLOKA_TUNNEL.moveMorionWormQM(); end);
end;

function onTrade(player,npc,trade)
    if (not GetMobByID(MORION_WORM):isSpawned() and npcUtil.tradeHas(trade, 643)) then -- Iron Ore
        local x = npc:getXPos();
        local y = npc:getYPos();
        local z = npc:getZPos();
        npc:setStatus(dsp.status.DISAPPEAR);
        player:confirmTrade();
        SpawnMob(MORION_WORM):updateClaim(player);
        GetMobByID(MORION_WORM):setPos(x+1,y,z+1);
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(MORION_WORM_1);
end;
