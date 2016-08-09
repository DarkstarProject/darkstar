-----------------------------------
--  Area: Western Adoulin
--  NPC: Majoirelle
--  Type: Standard NPC and Quest NPC
--  Involved With Quest: 'Order Up'
--  @zone 256
-- @pos 127 4 -81
-----------------------------------
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local Order_Up = player:getQuestStatus(ADOULIN, ORDER_UP);
    local Order_Marjoirelle = bit.band(bit.rshift(player:getVar("Order_Up_NPCs"), 8), 1);

    if ((Order_Up == QUEST_ACCEPTED) and (Order_Marjoirelle < 1)) then
        -- Progresses Quest: 'Order Up'
        player:startEvent(0x0044);
    else
        -- Standard Dialogue
        player:startEvent(0x021A);
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
    if (csid == 0x0044) then
        -- Progresses Quest: 'Order Up'
        player:addVar("Order_Up_NPCs", bit.lshift(1, 8));
    end
end;
