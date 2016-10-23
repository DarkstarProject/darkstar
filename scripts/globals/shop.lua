-----------------------------------
--
--    Functions for Shop system
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/conquest");
require("scripts/globals/log_ids");

-----------------------------------
-- function showShop
--
-- Total stock cuts off after 16 items. 
-- If you add more than that the extras won't display.
-----------------------------------

function showShop(player, nation, stock)

correction = 1;

    if (nation ~= STATIC) then
        correction = (1 + (0.20 * (9 - player:getFameLevel(nation)) / 8))*SHOP_PRICE;
    end

    player:createShop(#stock/2, nation);

    for i = 1, #stock, 2 do
        player:addShopItem(stock[i],stock[i+1]*correction);
    end

player:sendMenu(2);
end;

-----------------------------------
-- function showNationShop
--
-- Total stock cuts off after 16 items. 
-- If you add more than that the extras won't display.
-----------------------------------

function showNationShop(player, nation, stock)

conquest = getNationRank(nation);
playerNation = player:getNation();

correction = 1;

    if (nation ~= STATIC) then
        correction = (1 + (0.20 * (9 - player:getFameLevel(nation)) / 8))*SHOP_PRICE;
    end

    player:createShop(#stock/3, nation);

    for i = 1, #stock, 3 do
        if (stock[i+2] == 1) then
            if (playerNation == nation and conquest == 1) then
                player:addShopItem(stock[i],stock[i+1]*correction);
            end
        elseif (stock[i+2] == 2) then
            if (conquest <= 2) then
                player:addShopItem(stock[i],stock[i+1]*correction);
            end
        else
            player:addShopItem(stock[i],stock[i+1]*correction);
        end
    end

player:sendMenu(2);
end;

-----------------------------------
-- function ShowOPVendorShop
-- creates the usual OP vendor store
-- {ItemID,Price}
-----------------------------------

function ShowOPVendorShop(player)

    stock = 
    {
        0x1034,316,        --Antidote
        0x1037,800,        --Echo Drops
        0x1020,4832,    --Ether
        0x1036,2595,    --Eye Drops
        0x1010,910        --Potion
    };

    showShop(player, STATIC, stock);

end;