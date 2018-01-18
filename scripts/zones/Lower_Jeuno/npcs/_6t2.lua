-----------------------------------
-- Area: Lower Jeuno
--  Door: Merchant's House
--  Starts & Finishes Quest: Save My Son
--  Optional Involvement in Quest: Chocobo's Wounds, Path of the Beastmaster
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local ANewDawn = player:getQuestStatus(JEUNO,A_NEW_DAWN);
    local ANewDawnEvent = player:getVar("ANewDawn_Event");
    local ScatteredIntoShadow = player:getQuestStatus(JEUNO,SCATTERED_INTO_SHADOW);

    local SaveMySon = player:getVar("SaveMySon_Event");
    
    local ChocobosWounds = player:getQuestStatus(JEUNO, CHOCOBO_S_WOUNDS);
    
    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();
    
    -- A New Dawn (BST AF3)
    if (ScatteredIntoShadow == QUEST_COMPLETED and ANewDawn == QUEST_AVAILABLE) then
        if (mJob == 9 and mLvl >= 50) then
            if (ANewDawnEvent == 0) then
                player:startEvent(5);
            elseif (ANewDawnEvent == 1) then
                player:startEvent(4);
            end
        else
            player:startEvent(1); 
        end
    elseif (ANewDawn == QUEST_ACCEPTED) then
        if (ANewDawnEvent == 2) then
            player:startEvent(2); 
        elseif (ANewDawnEvent >= 4) then
            player:startEvent(3); 
        end
    elseif (ANewDawn == QUEST_COMPLETED and ANewDawnEvent == 6) then
        player:startEvent(0); 
    
    -- Save My Son
    elseif (player:getQuestStatus(JEUNO, SAVE_MY_SON) == QUEST_AVAILABLE and mLvl >= 30) then
        player:startEvent(164);
    elseif (player:getQuestStatus(JEUNO, SAVE_MY_SON) == QUEST_ACCEPTED) then
        if (SaveMySon == 0) then
            player:startEvent(229);
        elseif (SaveMySon == 1) then
            player:startEvent(163);
        end
    elseif (player:needToZone() == false and player:getQuestStatus(JEUNO, SAVE_MY_SON) == QUEST_COMPLETED and SaveMySon == 2) then
        player:startEvent(132);
    
    -- Chocobos Wounds
    elseif (ChocobosWounds == QUEST_AVAILABLE) then
        player:startEvent(64);
    elseif (player:getVar("ChocobosWounds_Event") > 3) then
        player:startEvent(63);
        
    -- Standard Dialogue?, Probably Wrong
    else
        player:messageSpecial(ITS_LOCKED); 
    end

    return 1;

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

    if (csid == 164 and option == 0) then
        player:addQuest(JEUNO, SAVE_MY_SON);
    elseif (csid == 163) then
        if (player:getFreeSlotsCount(0) >= 1) then
            player:addTitle(LIFE_SAVER);
            player:addItem(13110);
            player:messageSpecial(ITEM_OBTAINED, 13110);
            player:addGil(GIL_RATE*2100);
            player:messageSpecial(GIL_OBTAINED, GIL_RATE*2100);
            player:setVar("SaveMySon_Event",2);
            player:needToZone(true);
            player:addFame(JEUNO,30);
            player:completeQuest(JEUNO,SAVE_MY_SON);
        else
           player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13110);
        end
    elseif (csid == 132) then
        player:setVar("SaveMySon_Event",0);
    elseif (csid == 5) then
        player:setVar("ANewDawn_Event",1);
        if (option == 1) then     
            player:addQuest(JEUNO, A_NEW_DAWN);
            player:setVar("ANewDawn_Event",2);
        end
    elseif (csid == 4 and option == 1) then
        player:addQuest(JEUNO, A_NEW_DAWN);
        player:setVar("ANewDawn_Event",2);
    elseif (csid == 0) then
        player:setVar("ANewDawn_Event",0);
    end

end;
