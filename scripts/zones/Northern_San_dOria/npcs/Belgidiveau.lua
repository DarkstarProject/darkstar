-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Belgidiveau
-- Starts and Finishes Quest: Trouble at the Sluice
-- @zone 231
-- @pos -98 0 69
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    troubleAtTheSluice = player:getQuestStatus(SANDORIA,TROUBLE_AT_THE_SLUICE);
    NeutralizerKI = player:hasKeyItem(NEUTRALIZER);
    
    if (troubleAtTheSluice == QUEST_AVAILABLE and player:getFameLevel(SANDORIA) >= 3) then
        player:startEvent(0x0039);
    elseif (troubleAtTheSluice == QUEST_ACCEPTED and NeutralizerKI == false) then
        player:startEvent(0x0037);
    elseif (NeutralizerKI) then
        player:startEvent(0x0038);
    else
        player:startEvent(0x0249);
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
    
    if (csid == 0x0039 and option == 0) then
        player:addQuest(SANDORIA,TROUBLE_AT_THE_SLUICE);
        player:setVar("troubleAtTheSluiceVar",1);
    elseif (csid == 0x0038) then
        if (player:getFreeSlotsCount() == 0) then 
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16706); -- Heavy Axe
        else
            player:tradeComplete();
            player:delKeyItem(NEUTRALIZER);
            player:addItem(16706);
            player:messageSpecial(ITEM_OBTAINED,16706); -- Heavy Axe
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,TROUBLE_AT_THE_SLUICE);
        end
    end
    
end;