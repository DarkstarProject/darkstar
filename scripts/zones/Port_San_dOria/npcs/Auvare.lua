-----------------------------------
-- Area: Port San d'Oria
-- NPC: Auvare
-- Standard Info NPC
-----------------------------------

package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) ==QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeAuvare") == 0) then 
            player:messageSpecial(AUVARE_DIALOG);
            player:setVar("FFR",player:getVar("FFR") - 1);
            player:setVar("tradeAuvare",1);
            player:messageSpecial(FLYER_ACCEPTED);
            player:messageSpecial(FLYERS_HANDED,17 - player:getVar("FFR"));
            player:tradeComplete();
            elseif (player:getVar("tradeAuvare") ==1) then
                player:messageSpecial(FLYER_ALREADY);

end
end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x256);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



