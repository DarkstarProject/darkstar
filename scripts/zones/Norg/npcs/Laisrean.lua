-----------------------------------
-- Area: Norg
-- NPC: Laisrean
-- Starts and Ends Quest: The Sahagin's Stash
-- @zone 252
-- @pos -2.251 -1 21.654
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    Stash = player:getQuestStatus(OUTLANDS,THE_SAHAGINS_STASH);
    mLvl = player:getMainLvl();
    SeaStatue = player:hasKeyItem(SEA_SERPENT_STATUE);
    
    if (Stash == QUEST_AVAILABLE and player:getFameLevel(NORG) >= 4 and mLvl >= 5) then
        player:startEvent(0x0021); -- Start quest
    elseif (Stash == QUEST_ACCEPTED) then
        if (SeaStatue == true) then
            player:startEvent(0x0023,SEA_SERPENT_STATUE); -- Finish quest
        else
            player:startEvent(0x0022); -- Reminder Dialogue
        end
    else
        player:startEvent(0x0053); -- Standard Conversation
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
    if (csid == 0x0021 and option == 1) then
        player:addQuest(OUTLANDS,THE_SAHAGINS_STASH);
    elseif (csid == 0x0023) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4946); 
        else
            player:delKeyItem(SEA_SERPENT_STATUE);
            player:addItem(4946); -- Scroll of Utsusemi: Ichi
            player:messageSpecial(ITEM_OBTAINED, 4946);
            player:addTitle(TREASUREHOUSE_RANSACKER);
            player:addFame(NORG,75);
            player:completeQuest(OUTLANDS,THE_SAHAGINS_STASH);
        end
    end

end;

