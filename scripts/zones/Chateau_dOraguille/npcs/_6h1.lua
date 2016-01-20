-----------------------------------
-- Area: Chateau d'Oraguille
-- Door: Prince Regent's Rm
-- Starts and Finishes Quest: Prelude of Black and White (Start), Pieuje's Decision (Start)
-- @pos -37 -3 31 233
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Chateau_dOraguille/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    messengerFromBeyond = player:getQuestStatus(SANDORIA,MESSENGER_FROM_BEYOND);
    preludeOfBandW = player:getQuestStatus(SANDORIA,PRELUDE_OF_BLACK_AND_WHITE);
    pieujesDecision = player:getQuestStatus(SANDORIA,PIEUJE_S_DECISION);
    
    if (player:getMainJob() == 3 and player:getMainLvl() >= AF2_QUEST_LEVEL) then
        if (messengerFromBeyond == QUEST_COMPLETED and preludeOfBandW == QUEST_AVAILABLE) then
            player:startEvent(0x0227); -- Start Quest "Prelude of Black and White"
        elseif (preludeOfBandW == QUEST_COMPLETED and pieujesDecision == QUEST_AVAILABLE) then
            player:startEvent(0x0228); -- Start Quest "Pieuje's Decision"
        end
    elseif (player:hasCompletedMission(SANDORIA,LIGHTBRINGER) and player:getRank() == 9 and player:getVar("Cutscenes_8-2") == 1) then
        player:startEvent(0x004A);
    else
        player:startEvent(0x020b);
    end
    
    return 1;
    
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
    
    if (csid == 0x0227) then
        player:addQuest(SANDORIA,PRELUDE_OF_BLACK_AND_WHITE);
    elseif (csid == 0x0228) then
        player:addQuest(SANDORIA,PIEUJE_S_DECISION);
    elseif (csid == 0x004A) then
        player:setVar("Cutscenes_8-2",2);
    end
    
end;