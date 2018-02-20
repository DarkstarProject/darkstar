-----------------------------------
--  Area: Western Adoulin
--  NPC: Defliaa
--  Type: Quest NPC and Shop NPC
--  Involved with Quest: 'All the Way to the Bank'
--  !pos 43 2 -113 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Western_Adoulin/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");
require("scripts/globals/shop");

function onTrade(player,npc,trade)
    -- ALL THE WAY TO THE BANK
    if (player:hasKeyItem(TARUTARU_SAUCE_INVOICE)) then
        local ATWTTB_Paid_Defliaa = player:getMaskBit(player:getVar("ATWTTB_Payments"), 0);
        if (not ATWTTB_Paid_Defliaa and npcUtil.tradeHas( trade, {{"gil",19440}} )) then
            player:startEvent(5069);
        end
    end
end;

function onTrigger(player,npc)
    player:showText(npc, DEFLIAA_SHOP_TEXT);
    local stock =
    {
        5166, 3400,   -- Coeurl Sub
        4421, 1560,   -- Melon Pie
        5889, 19440,  -- Stuffed Pitaru
        5885, 18900,  -- Saltena
        4396, 280,    -- Sausage Roll
        4356, 200,    -- White Bread
        5686, 800,    -- Cheese Sandwich
    }
    showShop(player, STATIC, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    -- ALL THE WAY TO THE BANK
    if (csid == 5069) then
        player:confirmTrade();
        player:setMaskBit("ATWTTB_Payments", 0, true);
        if (player:isMaskFull(player:getVar("ATWTTB_Payments"), 5)) then
            npcUtil.giveKeyItem(player, TARUTARU_SAUCE_RECEIPT);
        end
    end
end;
