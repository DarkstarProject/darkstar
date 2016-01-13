-----------------------------------
-- Area: Port San d'Oria
--  NPC: Prietta
-- Standard Info NPC
local text = require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) ==QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradePrietta") == 0) then 
            player:messageSpecial(text.PRIETTA_DIALOG);
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradePrietta",1);
            player:messageSpecial(text.FLYER_ACCEPTED);
            player:messageSpecial(text.FLYERS_HANDED,17 - player:getVar("FFR"));
            player:tradeComplete();
            elseif (player:getVar("tradePrietta") ==1) then
                player:messageSpecial(text.FLYER_ALREADY);
            end
        end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x254);
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
end;
