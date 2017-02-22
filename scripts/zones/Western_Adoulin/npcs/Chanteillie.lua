-----------------------------------
--  Area: Western Adoulin
--  NPC: Chanteillie
--  Type: Standard NPC and Quest NPC
--  Involved with Quests: 'Do Not Go Into the Light'
--                        'Vegetable Vegetable Crisis'
--  @zone 256
--  @pos 89 0 -75 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/npc_util");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Western_Adoulin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local DNGITL = player:getQuestStatus(ADOULIN, DO_NOT_GO_INTO_THE_LIGHT);
    local VVC = player:getQuestStatus(ADOULIN, VEGETABLE_VEGETABLE_CRISIS);
    
    if ((DNGITL == QUEST_ACCEPTED) and (player:getVar("DNGITL_Status") == 3) and npcUtil.tradeHas(trade, {3927, 658, 4096})) then
        -- Trading Urunday Lumber x1, Damascus Ingot x1, and Fire Crystal x1
        -- Progresses Quest: 'Do Not Go Into the Light'
        player:startEvent(0x13D4);
    elseif  ((VVC == QUEST_ACCEPTED) and (player:getVar("VVC_Status") == 1) and npcUtil.tradeHas(trade, {3927, 3919, 8708})) then
        -- Trading Urunday Lumber x1, Midrium Ingot x1, and Raaz Leather x1
        -- Progresses Quest: 'Vegetable Vegetable Crisis'
        player:startEvent(0x13E1);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA);
    local DNGITL = player:getQuestStatus(ADOULIN, DO_NOT_GO_INTO_THE_LIGHT);
    local VVC = player:getQuestStatus(ADOULIN, VEGETABLE_VEGETABLE_CRISIS);

    if ((VVC == QUEST_ACCEPTED) and (player:getVar("VVC_Status") == 1)) then
        -- Reminder during Quest: 'Vegetable Vegetable Crisis'
        player:startEvent(0x13E0);
    elseif ((DNGITL == QUEST_ACCEPTED) and player:hasKeyItem(INVENTORS_COALITION_PICKAXE)) then
        -- Reminder during Quest: 'Do Not Go Into The Light' 
        player:startEvent(0x13D5);
    else
        if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
            -- Standard dialogue
            player:startEvent(0x024C);
        else
            -- Dialogue prior to joining colonization effort
            player:startEvent(0x0213);
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
    if (csid == 0x13D4) then
        -- Progresses Quest: 'Do Not Go Into the Light'
        player:tradeComplete();
        player:addKeyItem(INVENTORS_COALITION_PICKAXE);
        player:messageSpecial(KEYITEM_OBTAINED, INVENTORS_COALITION_PICKAXE);
        player:setVar("DNGITL_Status", 0);
    elseif (csid == 0x13E1) then
        -- Progresses Quest: 'Vegetable Vegetable Crisis'
        player:tradeComplete();
        player:setVar("VVC_Status", 2);
        player:setVar("VVC_Gameday_Wait", vanaDay());
    end
end;
