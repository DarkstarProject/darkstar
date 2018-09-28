-----------------------------------
-- Area: Western Adoulin
--  NPC: Terwok
-- Type: Standard NPC and Quest NPC
--  Involved With Quest: 'Order Up'
--  @zone 256
-- !pos 127 4 -81
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local Order_Up = player:getQuestStatus(ADOULIN, ORDER_UP);
    local Order_Terwok = player:getMaskBit(player:getVar("Order_Up_NPCs"), 7);

    if ((Order_Up == QUEST_ACCEPTED) and (not Order_Terwok)) then
        -- Progresses Quest: 'Order Up'
        player:startEvent(67);
    else
        -- Standard Dialogue
        player:startEvent(532);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 67) then
        -- Progresses Quest: 'Order Up'
        player:setMaskBit("Order_Up_NPCs", 7, true);
    end
end;
