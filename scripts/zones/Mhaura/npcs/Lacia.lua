-----------------------------------
--    Area: Mhaura
--    NPC: Lacia
--    Starts Quest: Trial Size Trial By Lightning
--  The "TrialSizeLightning_date" still needs to be set at the BCNM/Mob level to reflect defeat by the Avatar
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/globals/teleports");
require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(1548,1) == true and player:getQuestStatus(OTHER_AREAS,TRIAL_SIZE_TRIAL_BY_LIGHTNING) == QUEST_ACCEPTED and player:getMainJob() == JOBS.SMN) then
        player:startEvent(0x272a,0,1548,5,20);
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    local TrialSizeLightning = player:getQuestStatus(OTHER_AREAS,TRIAL_SIZE_TRIAL_BY_LIGHTNING);

    if (player:getMainLvl() >= 20 and player:getMainJob() == JOBS.SMN and TrialSizeLightning == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 2) then --Requires player to be Summoner at least lvl 20
        player:startEvent(0x2729,0,1548,5,20);     --mini tuning fork of lightning, zone, level
    elseif (TrialSizeLightning == QUEST_ACCEPTED) then
        local LightningFork = player:hasItem(1548);
        
        if (LightningFork == true) then 
            player:startEvent(0x2722); --Dialogue given to remind player to be prepared
        elseif (LightningFork == false and tonumber(os.date("%j")) ~= player:getVar("TrialSizeLightning_date")) then
            player:startEvent(0x272d,0,1548,5,20); --Need another mini tuning fork
        end
    elseif (TrialSizeLightning == QUEST_COMPLETED) then
        player:startEvent(0x272c); --Defeated Ramuh
    else
        player:startEvent(0x2725); --Standard dialogue
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
    if (csid == 0x2729 and option == 1) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1548); --Mini tuning fork 
        else
            player:setVar("TrialSizeLightning_date", 0);
            player:addQuest(OTHER_AREAS,TRIAL_SIZE_TRIAL_BY_LIGHTNING);
            player:addItem(1548); 
            player:messageSpecial(ITEM_OBTAINED,1548); 
        end
    elseif (csid == 0x272d and option == 1) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,1548); --Mini tuning fork 
        else
            player:addItem(1548); 
            player:messageSpecial(ITEM_OBTAINED,1548); 
        end
    elseif (csid == 0x272a and option == 1) then
        toCloisterOfStorms(player);
    end    
end;



