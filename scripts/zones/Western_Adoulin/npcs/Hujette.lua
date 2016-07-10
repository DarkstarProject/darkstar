-----------------------------------
--  Area: Western Adoulin
--  NPC: Hujette
--  Type: Quest NPC and Shop NPC
--  Involved with Quest: 'All the Way to the Bank'
--  @zone 256
--  @pos 35 0 -56 256
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
        local ATWTTB_Paid_Hujette = player:getMaskBit(player:getVar("ATWTTB_Payments"), 1);
        if ((not ATWTTB_Paid_Hujette) and npcUtil.tradeHas(trade, nil, 3000)) then
            -- Progresses Quest: 'All the Way to the Bank'
            player:startEvent(0x13CE);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    -- Standard shop
    player:showText(npc, HUJETTE_SHOP_TEXT);
    local stock =
    {
        0x1735, 20,     -- Campfire Choco
        0x1734, 8,      -- Trail Cookie
        0x1736, 20,     -- Cascade Candy
        0x168F, 544,    -- Chocolate Crepe
        0x141B, 3000,   -- Snoll Gelato
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
    if (csid == 0x13CE) then
        -- Progresses Quest: 'All the Way to the Bank'
        player:tradeComplete();
        player:setMaskBit("ATWTTB_Payments", 1, true);
        if (player:isMaskFull(player:getVar("ATWTTB_Payments"), 5)) then
            player:addKeyItem(TARUTARU_SAUCE_RECEIPT);
            player:messageSpecial(KEYITEM_OBTAINED, TARUTARU_SAUCE_RECEIPT);
        end
    end
end;
