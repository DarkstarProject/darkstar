-----------------------------------
--  NPC: Small Keyhole
-- Area: Sacrarium
-- !pos 99.772 -1.614 51.545 28
-----------------------------------
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Sacrarium/TextIDs")
require("scripts/zones/Sacrarium/MobIDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrigger(player,npc)
    if player:hasKeyItem(dsp.ki.TEMPLE_KNIGHT_KEY) then
        GetNPCByID(npc:getID() - 3):openDoor(15)
    else
        player:messageSpecial(SMALL_KEYHOLE)
    end
end

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 1659) then
        if npc:getLocalVar("canTradeSecondKey") == 0 then
            npc:setLocalVar("canTradeSecondKey", 1)
            player:startEvent(100)
        else
            player:messageSpecial(CANNOT_TRADE_NOW)
        end
    end
end

function onEventUpdate(player,csid,option)
    if csid == 100 and option == 2 then
        GetNPCByID(SMALL_KEYHOLE):setLocalVar("canTradeSecondKey", 0)
    end
end

function onEventFinish(player,csid,option)
    if csid == 100 then
        player:messageSpecial(CORAL_KEY_BREAKS, 0, 1659)
        player:confirmTrade()
    end
end
