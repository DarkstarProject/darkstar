-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Ugrihd
-- Coin Exchange Vendor
-- !pos -63.079 -6 -28.571 50
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
-----------------------------------
require("scripts/globals/besieged")
require("scripts/globals/status")
-----------------------------------

local ImperialPieces =
{
    [1] = -- Imperial Bronze Piece
    {
        item = 2184,
        price = 20
    },
    [2] = -- Imperial Silver Piece
    {
        item = 2185,
        price = 100
    },
    [3] = -- Imperial Mythril Piece
    {
        item = 2186,
        price = 200
    },
    [4] = -- Imperial Gold Piece
    {
        item = 2187,
        price = 1000
    }
}

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local rank = dsp.besieged.getMercenaryRank(player)
    local badge = dsp.besieged.badges[rank]
    local points = player:getCurrency("imperial_standing")
    player:startEvent(150, rank, badge, points, 0, 0, 0, 0, 0, 0)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option, npc)
    if csid == 150 and option < 0x40000000 then
        local quantity = bit.rshift(option, 0x8)
        local stacks = math.floor(quantity / 99)
        local remainder = quantity % 99
        local coinType = bit.band(option, 0xFF)
        local item = ImperialPieces[coinType].item
        local price = ImperialPieces[coinType].price

        if player:getCurrency("imperial_standing") < quantity * price then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, item)
            return
        end

        local slotsNeeded = stacks
        if remainder > 0 then
            slotsNeeded = slotsNeeded + 1
        end
        
        if player:getFreeSlotsCount() < slotsNeeded then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED, item)
            return
        end

        for i = 1, stacks do
            player:addItem(item, 99)
        end
        
        if remainder > 0 then
            player:addItem(item, remainder)
        end
        
        player:delCurrency("imperial_standing", quantity * price)
        npc:showText(npc, ID.text.UGRIHD_PURCHASE_DIALOGUE)
        player:messageSpecial(ID.text.ITEM_OBTAINED, item)
    end
end