-----------------------------------
--  Area: Western Adoulin
--  NPC: Grevan
--  Type: Standard NPC and Quest NPC
--  Involved With Quest: 'Order Up'
--  @zone 256
--  @pos 50 0 6 256
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
    local Order_Grevan = player:getMaskBit(player:getVar("Order_Up_NPCs"), 10);

    if ((Order_Up == QUEST_ACCEPTED) and (not Order_Grevan)) then
        -- Progresses Quest: 'Order Up'
        player:startEvent(0x0045);
    else
        if (player:getQuestStatus(ADOULIN, HYPOCRITICAL_OATH) == QUEST_COMPLETED) then
            if (player:getQuestStatus(ADOULIN, NOTSOCLEAN_BILL) == QUEST_COMPLETED) then
                -- Standard dialogue after stamping out plague in Svenja quest line
                player:startEvent(0x00BC);
            else
                -- Standard dialogue before stamping out plague in Svenja quest line
                player:startEvent(0x00AB); 
            end
        else
            -- Standard dialogue prior to Svenja quest line
            player:startEvent(0x021D);
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
    if (csid == 0x0045) then
        -- Progresses Quest: 'Order Up'
        player:setMaskBit("Order_Up_NPCs", 10, true);
    end
end;




