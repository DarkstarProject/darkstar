-----------------------------------
-- Area: Oldton_Movalpolos
--  NPC: Scrawled_Writing
-- Allows players to spawn NM Goblin Wolfman
-----------------------------------
local ID = require("scripts/zones/Oldton_Movalpolos/IDs");
require("scripts/globals/npc_util");
-----------------------------------

function onTrade(player,npc,trade)
    local mob = GetMobByID(ID.mob.GOBLIN_WOLFMAN);
    if ( npcUtil.tradeHas(trade, 4541) and not mob:isSpawned() ) then
        player:confirmTrade();
        local x = npc:getXPos();
        local y = npc:getYPos();
        local z = npc:getZPos();
        mob:setSpawn(x-1,y,z)
        SpawnMob(ID.mob.GOBLIN_WOLFMAN):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;