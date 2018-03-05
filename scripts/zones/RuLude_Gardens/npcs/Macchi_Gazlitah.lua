-----------------------------------
-- Area: Ru'Lud Gardens
--  NPC: Macchi Gazlitah
-- Standard Mechant NPC
-- Sells base items, then sells better items based
-- on a gil amount of what has been already purchased
-- in a given timeframe.
-----------------------------------
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
 -- TODO: The contents of her shop changes based on gil over time (resets on JP midnight)
 --       Right now only her first tier of stock is shown
 --       See WIKI for the shop tiers based on the amount sold
    player:showText(npc,MACCHI_GAZLITAH_SHOP_DIALOG1);

    local stock =
    {
        5703,  100,  -- Uleguerand Milk
        5684,  250,  -- Chalaimbille
        17905, 100,  -- Wormy Broth
        -- 5686,    800, -- Cheese Sandwich
        -- 5729,   3360, -- Bavarois
        -- 5718,   1300, -- Cream Puff
        -- 461,    5000, -- Buffalo Milk Case
        -- 5152,   1280, -- Buffalo Meat
        -- 4722,  31878, -- Enfire II
        -- 4723,  30492, -- Enblizzard II
        -- 4724,  27968, -- Enaero II
        -- 4725,  26112, -- Enstone II
        -- 4726,  25600, -- Enthunder II
        -- 4727,  33000, -- Enwater II
        -- 4850, 150000  -- Refresh II
    }

    showShop(player, JEUNO, stock);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
