-----------------------------------
-- Area: Sacrarium
--  NPC: Large Keyhole
-- Notes: Used to open R. Gate
-- !pos 100.231 -1.414 51.700 28
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
        GetNPCByID(npc:getID() - 2):openDoor(15)
    else
        player:messageSpecial(LARGE_KEYHOLE_DESCRIPTION)
    end
end

function onTrade(player,npc,trade)
    if npcUtil.tradeHas(trade, 1658) then
        local smallKeyhole = GetNPCByID(SMALL_KEYHOLE)
        if smallKeyhole:getLocalVar("canTradeSecondKey") == 1 then
            GetNPCByID(npc:getID() - 2):openDoor(15)
            smallKeyhole:setLocalVar("canTradeSecondKey", 0)
        else
            player:messageSpecial(CANNOT_TRADE_NOW)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
