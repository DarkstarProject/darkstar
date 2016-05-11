-----------------------------------
-- Area: Rabao
-- NPC:  Rahi Fohlatti
-- Starts Quest: Trial Size Trial by Wind
-- @pos -17 7 -10 247
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/globals/teleports");
require("scripts/zones/Rabao/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(1546,1) and player:getQuestStatus(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WIND) == QUEST_ACCEPTED and player:getMainJob() == JOBS.SMN) then
        player:startEvent(0x006d,0,1546,3,20);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local TrialSizeWind = player:getQuestStatus(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WIND);

    if (player:getMainLvl() >= 20 and player:getMainJob() == JOBS.SMN and TrialSizeWind == QUEST_AVAILABLE and player:getFameLevel(RABAO) >= 2) then --Requires player to be Summoner at least lvl 20
        player:startEvent(0x006c,0,1546,3,20);     --mini tuning fork, zone, level
    elseif (TrialSizeWind == QUEST_ACCEPTED) then
        local WindFork = player:hasItem(1546);
        
        if (WindFork) then 
            player:startEvent(0x0044); -- Dialogue given to remind player to be prepared
        elseif (WindFork == false and tonumber(os.date("%j")) ~= player:getVar("TrialSizeWind_date")) then
            player:startEvent(0x0070,0,1546,3,20); -- Need another mini tuning fork
        else
            player:startEvent(0x0072); -- Standard dialog when you loose, and you don't wait 1 real day
        end
    elseif (TrialSizeWind == QUEST_COMPLETED) then
        player:startEvent(0x006f); -- Defeated Avatar
    else
        player:startEvent(0x0047); -- Standard dialogue
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
    
    if (csid == 0x006c and option == 1) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1546); --Mini tuning fork 
        else
            player:addQuest(OUTLANDS,TRIAL_SIZE_TRIAL_BY_WIND);
            player:addItem(1546); 
            player:messageSpecial(ITEM_OBTAINED,1546); 
        end
    elseif (csid == 0x0070 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1546); --Mini tuning fork 
        else
            player:addItem(1546); 
            player:messageSpecial(ITEM_OBTAINED,1546); 
        end
    elseif (csid == 0x006d and option == 1) then
        toCloisterOfGales(player);
    end
    
end;