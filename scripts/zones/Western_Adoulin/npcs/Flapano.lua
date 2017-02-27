-----------------------------------
--  Area: Western Adoulin
--  NPC: Flapno
--  Type: Standard NPC, Quest NPC, and Shop NPC
--  Starts, Involved with, and Finishes Quest: 'Exotic Delicacies'
--  Involved with Quest: 'All the Way to the Bank'
--  @zone 256
--  @pos 70 0 -13 256
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
    local Exotic_Delicacies = player:getQuestStatus(ADOULIN, EXOTIC_DELICACIES);
    
    if (player:hasKeyItem(TARUTARU_SAUCE_INVOICE) and npcUtil.tradeHas(trade, nil, 5600)) then
        local ATWTTB_Paid_Flapano = player:getMaskBit(player:getVar("ATWTTB_Payments"), 2);
        -- Progresses Quest: 'All the Way to the Bank'
        if (not ATWTTB_Paid_Flapano) then
            player:startEvent(0x13CF);
        end
    elseif (Exotic_Delicacies == QUEST_ACCEPTED) then
        if (npcUtil.tradeHas(trade, {3916, 5954, 5954, 5949})) then
            -- Trading Saffron x1, Barnacle x2, and Mussel x1
            -- Finishes Quest: 'Exotic Delicacies'
            player:startEvent(0x0B2D);
        elseif (npcUtil.tradeHas(trade, 5974) or npcUtil.tradeHas(trade, 5975)) then
            -- Trading Barnacle Paella or Flapano's Paella
            player:startEvent(0x0B2E);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Exotic_Delicacies = player:getQuestStatus(ADOULIN, EXOTIC_DELICACIES);
    local TWW = player:getQuestStatus(ADOULIN, THE_WEATHERSPOON_WAR);

    if ((TWW == QUEST_ACCEPTED) and (player:getVar("Weatherspoon_War_Status") == 6)) then
        -- Dialogue near the end of Quest: 'The Weatherspoon War'
        player:startEvent(0x00BF);
    else
        -- Flapano offers his quest every other time the player talks to him
        if (player:getVar("Flapano_Odd_Even") > 0) then 
            if (Exotic_Delicacies == QUEST_ACCEPTED) then
                -- Reminds player of items for Quest: 'Exotic Delicacies'
                player:startEvent(0x0B2F);
            elseif (Exotic_Delicacies == QUEST_AVAILABLE) then
                --- Starts Quest: 'Exotic Delicacies'
                player:startEvent(0x0B2C);
            end
            player:setVar("Flapano_Odd_Even", 0);
        else
            -- Standard shop
            player:showText(npc, FLAPANO_SHOP_TEXT);
            local stock =
            {
                0x1737, 125,   -- Smoked Mackerel
                0x113F, 124,   -- Roasted Corn
                0x1152, 5000,  -- Mushroom Risotto
                0x1419, 5600,  -- Fish and Chips
                0x1147, 300,   -- Apple Juice
                0x1135, 160,   -- Rice Ball
                0x162C, 76475, -- Mushroom Sautee
            }
            showShop(player, STATIC, stock);

            if (Exotic_Delicacies ~= QUEST_COMPLETED) then
                player:setVar("Flapano_Odd_Even", 1);
            end
        end
    end
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
    if (csid == 0x0B2C) then
        if (option == 1) then
            --- Starts Quest: 'Exotic Delicacies'
            player:addQuest(ADOULIN, EXOTIC_DELICACIES);
        end
    elseif (csid == 0x0B2D) then
        -- Finishes Quest: 'Exotic Delicacies'
        if (npcUtil.giveItem(player, 5975)) then
            player:tradeComplete();
            player:setVar("Flapano_Odd_Even", 0);
            player:completeQuest(ADOULIN, EXOTIC_DELICACIES);
            player:addExp(1000 * EXP_RATE);
            player:addCurrency('bayld', 500 * BAYLD_RATE);
            player:messageSpecial(BAYLD_OBTAINED, 500 * BAYLD_RATE);
            player:addFame(ADOULIN);
        end
    elseif (csid == 0x13CF) then
        -- Progresses Quest: 'All the Way to the Bank'
        player:tradeComplete();
        player:setMaskBit("ATWTTB_Payments", 2, true);
        if (player:isMaskFull(player:getVar("ATWTTB_Payments"), 5)) then
            player:addKeyItem(TARUTARU_SAUCE_RECEIPT);
            player:messageSpecial(KEYITEM_OBTAINED, TARUTARU_SAUCE_RECEIPT);
        end
    end
end;
