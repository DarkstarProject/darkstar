-----------------------------------
--  Area: Western Adoulin
--  NPC: Virsaint
--  Type: Standard NPC and Quest NPC
--  Involved with Quests: 'Order Up'
--                        'The Curious Case of Melvien' 
--  @zone 256
-- @pos -9 0 67
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Western_Adoulin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local TCCOM = player:getQuestStatus(ADOULIN, THE_CURIOUS_CASE_OF_MELVIEN);
    local TCCOM_Need_KI = player:hasKeyItem(MELVIENS_TURN) and (not player:hasKeyItem(MELVIENS_DEATH))
    local Order_Up = player:getQuestStatus(ADOULIN, ORDER_UP);
    local Order_Mastan = player:getMaskBit(player:getVar("Order_Up_NPCs"), 11);

    if ((Order_Up == QUEST_ACCEPTED) and (not Order_Mastan)) then
        -- Progresses Quest: 'Order Up'
        player:startEvent(0x0046);
    elseif ((TCCOM == QUEST_ACCEPTED) and TCCOM_Need_KI) then
        -- Progresses Quest: 'The Curious Case of Melvien'
        player:startEvent(0x00B8);
    else
        -- Standard Dialogue
        player:startEvent(0x020D);
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
    if (csid == 0x0046) then
        -- Progresses Quest: 'Order Up'
        player:setMaskBit("Order_Up_NPCs", 11, true);
    elseif (csid == 0x00B8) then
        -- Progresses Quest: 'The Curious Case of Melvien'
        if (option == 1) then
            player:addKeyItem(MELVIENS_DEATH);
            player:messageSpecial(KEYITEM_OBTAINED, MELVIENS_DEATH);
        end
    end
end;
