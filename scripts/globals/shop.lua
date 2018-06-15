-----------------------------------
--
--    Functions for Shop system
--
-----------------------------------
require("scripts/globals/conquest")
require("scripts/globals/settings")
-----------------------------------

dsp = dsp or {}

dsp.shop =
{
    --[[ *******************************************************************************
        send general shop dialog to player
        stock cuts off after 16 items. if you add more, extras will not display
        stock is of form {itemId1, price1, itemId2, price2, ...}
        log is a log ID from scripts/globals/log_ids.lua
    ******************************************************************************* --]]
    general = function(player, stock, log)
        local priceMultiplier = 1

        if log then
            priceMultiplier = (1 + (0.20 * (9 - player:getFameLevel(log)) / 8)) * SHOP_PRICE
        else
            log = -1
        end

        player:createShop(#stock / 2, log)

        for i = 1, #stock, 2 do
            player:addShopItem(stock[i], stock[i+1] * priceMultiplier)
        end

        player:sendMenu(2)
    end,
    
    --[[ *******************************************************************************
        send nation shop dialog to player
        stock cuts off after 16 items. if you add more, extras will not display
        stock is of form {itemId1, price1, place1, itemId2, price2, place2, ...}
            where place is what place the nation must be in for item to be stocked        
        nation is a dsp.nation ID from scripts/globals/zone.lua
    ******************************************************************************* --]]
    nation = function(player, stock, nation)
        local rank = getNationRank(nation)
        local newStock = {}
        for i = 1, #stock, 3 do
            if
                (stock[i+2] == 1 and player:getNation() == nation and rank == 1) or
                (stock[i+2] == 2 and rank <= 2) or
                (stock[i+2] == 3)
            then
                table.insert(newStock, stock[i])
                table.insert(newStock, stock[i+1])
            end
        end
        dsp.shop.general(player, newStock, nation)
    end,

    --[[ *******************************************************************************
        send outpost shop dialog to player
    ******************************************************************************* --]]
    outpost = function(player)
        local stock =
        {
            4148,  316, -- Antidote
            4151,  800, -- Echo Drops
            4128, 4832, -- Ether
            4150, 2595, -- Eye Drops
            4112,  910, -- Potion
        }
        dsp.shop.general(player, stock)
    end,
}