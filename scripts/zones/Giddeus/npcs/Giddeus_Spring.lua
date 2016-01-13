-----------------------------------
-- Area: Giddeus
--  NPC: Giddeus Spring
-- Involved in Quest "Water Way to Go"
-- @pos -258 -2 -249 
-- @zone 145
-----------------------------------

require("scripts/globals/quests");
local text = require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST,WATER_WAY_TO_GO) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(504,1) and trade:getItemCount() == 1) then
            player:startEvent(0x0037);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x0036);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0037) then
        player:tradeComplete();
        player:addItem(4351);
        player:messageSpecial(text.ITEM_OBTAINED,4351);
    end
end;
