-----------------------------------
-- Area: Crawlers_Nest_[S]
--  NPC: Rodeupansat
-- Starts and Finishes Quest: EVIL_AT_THE_INLET
-- @zone 171
-- !pos 129.240 -34.353 25.927
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Crawlers_Nest_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    Eati = player:getQuestStatus(CRYSTAL_WAR,EVIL_AT_THE_INLET);
    
	-- Change to BRASS_RIBBON_OF_SERVICE later when Campaign has been added.
    if (Eati == QUEST_AVAILABLE and player:hasKeyItem(dsp.ki.BRONZE_RIBBON_OF_SERVICE) == true and player:getMainLvl() >= 30) then
        player:startEvent(107); -- Start quest "Evil at the Inlet"
    elseif (Eati == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.EVIL_WARDING_SEAL) == true) then
            player:startEvent(108); -- During quest after receiving KI and before losing KI
        else --(player:hasKeyItem(dsp.ki.EVIL_WARDING_SEAL) == false)
            player:startEvent(109); -- After losing KI and returning for reward
        end
    elseif (Eati == QUEST_COMPLETED) then
        player:startEvent(110); -- New standard dialog after "Requiem for the Departed"
    else
        player:startEvent(106); -- Standard dialog
    end
end;

function onEventUpdate(player,csid,option)
     --printf("CSID: %u",csid);
     --printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
     --printf("CSID: %u",csid);
     --printf("RESULT: %u",option);
    if (csid == 107 and option == 0) then
        player:addQuest(CRYSTAL_WAR,EVIL_AT_THE_INLET);
        player:addKeyItem(dsp.ki.EVIL_WARDING_SEAL);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.EVIL_WARDING_SEAL);
    elseif (csid == 109) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,4687);
        else
            player:addItem(4687);
            player:messageSpecial(ITEM_OBTAINED,4687);
            player:completeQuest(CRYSTAL_WAR,EVIL_AT_THE_INLET);
        end
    end
end;

