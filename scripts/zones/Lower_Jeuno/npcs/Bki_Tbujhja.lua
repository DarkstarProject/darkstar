-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Bki Tbujhja
-- Involved in Quest: The Old Monument
-- Starts and Finishes Quests: Path of the Bard (just start), The Requiem (BARD AF2)
-- @zone 245
-- @pos -22 0 -60
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(JEUNO,THE_REQUIEM) == QUEST_ACCEPTED and player:getVar("TheRequiemCS") == 2) then 
        if (trade:hasItemQty(4154,1) == true and trade:getItemCount() == 1) then 
            player:startEvent(0x0097); -- After trade Holy water for "The Requiem"
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    PainfulMemory = player:getQuestStatus(JEUNO,PAINFUL_MEMORY);
    TheRequiem = player:getQuestStatus(JEUNO,THE_REQUIEM);
    
    if (player:getVar("TheOldMonument_Event") == 1) then
        player:startEvent(0x00b5); -- For the quest "The Old Monument"
    elseif (player:getQuestStatus(JEUNO,A_MINSTREL_IN_DESPAIR) == QUEST_COMPLETED and player:getVar("PathOfTheBard_Event") == 0) then
        player:startEvent(0x00b6); -- Start Quest "Path of the Bard" (with var)
    elseif (player:getMainJob() == 10 and player:getMainLvl() >= 50 and PainfulMemory == QUEST_COMPLETED and TheRequiem == QUEST_AVAILABLE) then 
        if (player:getVar("TheRequiemCS") == 0) then
            player:startEvent(0x0091); -- Long dialog & Start Quest "The Requiem"
        else
            player:startEvent(0x0094); -- Shot dialog & Start Quest "The Requiem"
        end
    elseif (TheRequiem == QUEST_ACCEPTED and player:getVar("TheRequiemCS") == 2) then 
        player:startEvent(0x0092); -- During Quest "The Requiem" (before trading Holy Water)
    elseif (TheRequiem == QUEST_ACCEPTED and player:getVar("TheRequiemCS") == 3 and player:hasKeyItem(STAR_RING1) == false) then 
        rand = math.random(1,2);
        if (rand == 1) then 
            player:startEvent(0x0093); -- During Quest "The Requiem" (after trading Holy Water)
        else
            player:startEvent(0x0095); -- During Quest "The Requiem" (after trading Holy Water)
        end
    elseif (TheRequiem == QUEST_ACCEPTED and player:hasKeyItem(STAR_RING1) == true) then 
        player:startEvent(0x0096); -- Finish Quest "The Requiem"
    elseif (TheRequiem == QUEST_COMPLETED) then 
        player:startEvent(0x0086); -- Standard dialog after "The Requiem"
    else
        player:startEvent(0x00b4);
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
    
    if (csid == 0x00b5) then
           player:setVar("TheOldMonument_Event",2);
    elseif (csid == 0x00b6 and option == 0) then
        player:setVar("PathOfTheBard_Event",1);
    elseif (csid == 0x0091 and option == 1 or csid == 0x0094 and option == 1) then 
        player:addQuest(JEUNO,THE_REQUIEM);
        player:setVar("TheRequiemCS",2);
    elseif (csid == 0x0091 and option == 0) then 
        player:setVar("TheRequiemCS",1);
    elseif (csid == 0x0097) then 
        player:setVar("TheRequiemCS",3);
        player:messageSpecial(ITEM_OBTAINED,4154); -- Holy Water (just message)
    elseif (csid == 0x0096) then 
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,14098);
        else 
            player:addItem(14098);
            player:messageSpecial(ITEM_OBTAINED,14098); -- Choral Slippers
            player:addFame(JEUNO, 30);
            player:completeQuest(JEUNO,THE_REQUIEM);
        end        
    end
end;

