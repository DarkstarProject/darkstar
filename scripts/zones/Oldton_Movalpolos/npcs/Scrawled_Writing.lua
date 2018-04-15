-----------------------------------
-- Area: Oldton_Movalpolos
--  NPC: Scrawled_Writing
-- Allows players to spawn NM Goblin Wolfman
-----------------------------------
require("scripts/zones/Oldton_Movalpolos/MobIDs");
require("scripts/globals/npc_util");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local mob = GetMobByID(GOBLIN_WOLFMAN);
    if ( npcUtil.tradeHas(trade, 4541) and not mob:isSpawned() ) then
        player:confirmTrade();
        local x = npc:getXPos();
        local y = npc:getYPos();
        local z = npc:getZPos();
        mob:setPos(x-1,y,z);
        SpawnMob(GOBLIN_WOLFMAN):updateClaim(player);
		npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
