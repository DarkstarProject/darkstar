-----------------------------------
-- Area: Windurst Waters
--  NPC: Jatan-Paratan
-- Starts and Finished Quest: Wondering Minstrel
--    Working 100%
--  @zone = 238
--  @pos = -59 -4 22
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    wonderingstatus = player:getQuestStatus(WINDURST,WONDERING_MINSTREL);
    if (wonderingstatus == 1 and trade:hasItemQty(718,1) == true and trade:getItemCount() == 1 and player:getVar("QuestWonderingMin_var") == 1) then
        player:startEvent(0x027e);                 -- WONDERING_MINSTREL: Quest Finish
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

            --        player:delQuest(WINDURST,WONDERING_MINSTREL);


    wonderingstatus = player:getQuestStatus(WINDURST,WONDERING_MINSTREL);
    fame = player:getFameLevel(WINDURST)
    if (wonderingstatus == QUEST_AVAILABLE and fame >= 5) then
        rand = math.random(1,2);
        if (rand == 1) then
            player:startEvent(0x0279);          -- WONDERING_MINSTREL: Before Quest
        else
            player:startEvent(0x027a);          -- WONDERING_MINSTREL: Quest Start
        end
    elseif (wonderingstatus == QUEST_ACCEPTED) then
        player:startEvent(0x027b);                 -- WONDERING_MINSTREL: During Quest
    elseif (wonderingstatus == QUEST_COMPLETED and player:needToZone()) then
        player:startEvent(0x027f);                 -- WONDERING_MINSTREL: After Quest
    else
        hour = VanadielHour();
        if (hour >= 18 or hour <= 6) then
            player:startEvent(0x0263);             -- Singing 1 (daytime < 6 or daytime >= 18)
        else
            rand = math.random(1,2);
            if (rand == 1) then
                player:startEvent(0x0262);          -- Standard Conversation 1 (daytime)
            else
                player:startEvent(0x0267);             -- Standard Conversation 2 (daytime)
            end
        end
    end
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
    if (csid == 0x027a) then    -- WONDERING_MINSTREL: Quest Start
        player:addQuest(WINDURST,WONDERING_MINSTREL);
    elseif (csid == 0x027e) then  -- WONDERING_MINSTREL: Quest Finish
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17349);
        else
            player:tradeComplete(trade);
            player:completeQuest(WINDURST,WONDERING_MINSTREL)
            player:addItem(17349);
            player:messageSpecial(ITEM_OBTAINED,17349);
            player:addFame(WINDURST,75);
            player:addTitle(DOWN_PIPER_PIPEUPPERER);
            player:needToZone(true);
            player:setVar("QuestWonderingMin_var",0);
        end
    end
end;
