-----------------------------------
--  Area: Western Adoulin
--  NPC: Oka Qhantari
--  Type: Standard NPC and Quest NPC
--  Involved With Quest: 'Order Up'
--  @zone 256
-- @pos -30 3 -6
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
    local Order_Oka_Qhantari = bit.band(bit.rshift(player:getVar("Order_Up_NPCs"), 9), 1)

    if ((Order_Up == QUEST_ACCEPTED) and (Order_Oka_Qhantari < 1)) then
        -- Progresses Quest: 'Order Up'
        player:startEvent(0x0047);
    else
        -- Standard Dialogue
        player:startEvent(0x01FF);
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
    if (csid == 0x0047) then
        -- Progresses Quest: 'Order Up'
        player:addVar("Order_Up_NPCs", bit.lshift(1, 9));
    end
end;
