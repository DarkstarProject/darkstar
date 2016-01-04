-----------------------------------
-- Area: Windurst Waters
-- NPC: Chamama
-- Involved In Quest:     Inspector's Gadget
-- Starts Quest:        In a Pickle
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

FakeMoustache       = player:hasKeyItem(FAKE_MOUSTACHE);
InvisibleManSticker = player:hasKeyItem(INVISIBLE_MAN_STICKER);
InAPickle            = player:getQuestStatus(WINDURST,IN_A_PICKLE);
count                = trade:getItemCount();
gil                    = trade:getGil();

    if ((InAPickle == QUEST_ACCEPTED or InAPickle == QUEST_COMPLETED) and trade:hasItemQty(583,1) == true and count == 1 and gil == 0) then
        rand = math.random(1,4);
        if (rand <= 2) then
            if (InAPickle == QUEST_ACCEPTED) then
                player:startEvent(0x0293); -- IN A PICKLE: Quest Turn In (1st Time)
            elseif (InAPickle == QUEST_COMPLETED) then
                player:startEvent(0x0296,200);
            end
        elseif (rand == 3) then
            player:startEvent(0x0291);  -- IN A PICKLE: Too Light
            player:tradeComplete(trade);
        elseif (rand == 4) then
            player:startEvent(0x0292);  -- IN A PICKLE: Too Small
            player:tradeComplete(trade);
        end
    elseif (FakeMoustache == false) then
        InspectorsGadget = player:getQuestStatus(WINDURST,INSPECTOR_S_GADGET);

        if (InspectorsGadget == QUEST_ACCEPTED) then
            count = trade:getItemCount();
            SarutaCotton = trade:hasItemQty(834,4);

            if (SarutaCotton == true and count == 4) then
                player:startEvent(0x0228);
            end
        end
    elseif (InvisibleManSticker == false) then
        ThePromise = player:getQuestStatus(WINDURST,THE_PROMISE);
        
        if (ThePromise == QUEST_ACCEPTED) then
            count = trade:getItemCount();
            ShoalWeed = trade:hasItemQty(1148,1);

            if (ShoalWeed == true and count == 1) then
                player:startEvent(0x031f,0,0,INVISIBLE_MAN_STICKER);
            end
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
InspectorsGadget = player:getQuestStatus(WINDURST,INSPECTOR_S_GADGET);
ThePromise       = player:getQuestStatus(WINDURST,THE_PROMISE);
InAPickle         = player:getQuestStatus(WINDURST,IN_A_PICKLE);
NeedToZone         = player:needToZone();
    if (ThePromise == QUEST_ACCEPTED) then
        InvisibleManSticker = player:hasKeyItem(INVISIBLE_MAN_STICKER);
        
        if (InvisibleManSticker == true) then
            player:startEvent(0x0320);    
        else
            ThePromiseVar = player:getVar("ThePromise");
            
            if (ThePromiseVar == 1) then
                player:startEvent(0x031e,0,1148,INVISIBLE_MAN_STICKER);
            else
                player:startEvent(0x031d,0,1148,INVISIBLE_MAN_STICKER);
            end
        end
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        FakeMoustache = player:hasKeyItem(FAKE_MOUSTACHE);
        printf("mustach check");
        if (FakeMoustache == true) then
            player:startEvent(0x0229);
        else
            player:startEvent(0x0227,0,FAKE_MOUSTACHE);
        end
    elseif (InAPickle == QUEST_AVAILABLE and NeedToZone == false) then 
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x028e,0,4444); -- IN A PICKLE + RARAB TAIL: Quest Begin
        else
            player:startEvent(0x028b); -- Standard Conversation
        end
    elseif (InAPickle == QUEST_ACCEPTED or player:getVar("QuestInAPickle_var") == 1) then 
        player:startEvent(0x028f,0,4444); -- IN A PICKLE + RARAB TAIL: Quest Objective Reminder
    elseif (InAPickle == QUEST_COMPLETED and NeedToZone) then 
        player:startEvent(0x0294); -- IN A PICKLE: After Quest
    elseif (InAPickle == QUEST_COMPLETED and NeedToZone == false and player:getVar("QuestInAPickle_var") ~= 1) then 
        rand = math.random(1,2)
        if (rand == 1) then
            player:startEvent(0x0295); -- IN A PICKLE: Repeatable Quest Begin
        else
            player:startEvent(0x028b); -- Standard Conversation
        end
    else
        player:startEvent(0x028b); -- Standard Conversation
    end
-- player:delQuest(WINDURST,IN_A_PICKLE); [[[[[[[[[[[[[ FOR TESTING ONLY ]]]]]]]]]]]]]
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0228) then
        player:tradeComplete();
        player:addKeyItem(FAKE_MOUSTACHE);
        player:messageSpecial(KEYITEM_OBTAINED,FAKE_MOUSTACHE);
    elseif (csid == 0x031d) then
        player:setVar("ThePromise",1);
    elseif (csid == 0x031f) then
        player:tradeComplete();
        player:addKeyItem(INVISIBLE_MAN_STICKER);
        player:messageSpecial(KEYITEM_OBTAINED,INVISIBLE_MAN_STICKER);
    elseif (csid == 0x028e and option == 1) then  -- IN A PICKLE + RARAB TAIL: Quest Begin
        player:addQuest(WINDURST,IN_A_PICKLE);
    elseif (csid == 0x0293) then  -- IN A PICKLE: Quest Turn In (1st Time)
        player:tradeComplete(trade);
        player:completeQuest(WINDURST,IN_A_PICKLE);    
        player:needToZone(true);
        player:addItem(12505);
        player:messageSpecial(ITEM_OBTAINED,12505);
        player:addGil(GIL_RATE*200);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*200);
        player:addFame(WINDURST,WIN_FAME*75);
    elseif (csid == 0x0295 and option == 1) then 
        player:setVar("QuestInAPickle_var",1)
    elseif (csid == 0x0296) then  -- IN A PICKLE + 200 GIL: Repeatable Quest Turn In
        player:tradeComplete(trade);
        player:needToZone(true);
        player:addGil(GIL_RATE*200);
        player:addFame(WINDURST,WIN_FAME*8);
        player:setVar("QuestInAPickle_var",0)
    end
end;


            