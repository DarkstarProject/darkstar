-----------------------------------
--  Area: Southern San d'Oria
--  NPC: Maugie
--  General Info NPC
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action
----------------------------------- 

function onTrade(player,npc,trade) 
if(player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) ==QUEST_ACCEPTED)then
if(trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeMaugie") == 0)then 
player:messageSpecial(8709);
player:setVar("FFR",player:getVar("FFR") - 1);
player:setVar("tradeMaugie",1);
        player:messageSpecial(FLYER_ACCEPTED);
        trade:complete();
elseif(player:getVar("tradeMaugie") ==1)then
player:messageSpecial(8710);
end
end
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------

function onTrigger(player,npc)
    local grimySignpost = player:getQuestStatus(SANDORIA,GRIMY_SIGNPOSTS);
    if (grimySignpost == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 2) then
        player:startEvent(0x002d);
    elseif (grimySignpost == QUEST_ACCEPTED) then
        if(player:getVar("CleanSignPost") == 15) then
            player:startEvent(0x002c);
        else
            player:startEvent(0x002b);
        end
    elseif (grimySignpost == QUEST_COMPLETED) then
        player:startEvent(0x002a);
    else
        player:startEvent(0x002e); -- default text
    end
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
    if (csid == 0x002d and option == 0) then
        player:addQuest(SANDORIA,GRIMY_SIGNPOSTS);
    elseif (csid == 0x002c) then
        player:setVar("CleanSignPost",0);
        player:addFame(SANDORIA,SAN_FAME*30);
        player:addGil(GIL_RATE*1500);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*1500);
        player:completeQuest(SANDORIA,GRIMY_SIGNPOSTS);
    end
end;



