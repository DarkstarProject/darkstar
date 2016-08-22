-----------------------------------
--  Area: Western Adoulin
--  NPC: Terwok
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
    local Order_Terwok = bit.band(bit.rshift(player:getVar("Order_Up_NPCs"), 7), 1);

    if ((Order_Up == QUEST_ACCEPTED) and (Order_Terwok < 1)) then
        -- Progresses Quest: 'Order Up'
        player:startEvent(0x0043);
    else
        -- Standard Dialogue
        player:startEvent(0x0214);
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
    if (csid == 0x0043) then
        -- Progresses Quest: 'Order Up'
        player:addVar("Order_Up_NPCs", bit.lshift(1, 7));
    end
end;
