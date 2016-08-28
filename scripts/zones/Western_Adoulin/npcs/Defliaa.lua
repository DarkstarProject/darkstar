-----------------------------------
--  Area: Western Adoulin
--  NPC: Defliaa
--  Type: Quest NPC and Shop NPC
--  Involved with Quest: 'All the Way to the Bank'
--  @zone 256
--  @pos 43 2 -113 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Western_Adoulin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:hasKeyItem(TARUTARU_SAUCE_INVOICE)) then
        local ATWTTB_Paid_Defliaa = player:getMaskBit(player:getVar("ATWTTB_Payments"), 0);
        if ((not ATWTTB_Paid_Defliaa) and npcUtil.tradeHas(trade, nil, 19440)) then
            -- Progresses Quest: 'All the Way to the Bank'
            player:startEvent(0x13CD);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- Standard shop
    player:showText(npc, DEFLIAA_SHOP_TEXT);
    local stock =
    {
        0x142E, 3400,   -- Coeurl Sub
        0x1145, 1560,   -- Melon Pie
        0x1701, 19440,  -- Stuffed Pitaru
        0x16FD, 18900,  -- Saltena
        0x112C, 280,    -- Sausage Roll
        0x1104, 200,    -- White Bread
        0x1636, 800,    -- Cheese Sandwich
    }
    showShop(player, STATIC, stock);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x13CD) then
        -- Progresses Quest: 'All the Way to the Bank'
        player:tradeComplete();
        player:setMaskBit("ATWTTB_Payments", 0, true);
        if (player:isMaskFull(player:getVar("ATWTTB_Payments"), 5)) then
            player:addKeyItem(TARUTARU_SAUCE_RECEIPT);
            player:messageSpecial(KEYITEM_OBTAINED, TARUTARU_SAUCE_RECEIPT);
        end
    end
end;
