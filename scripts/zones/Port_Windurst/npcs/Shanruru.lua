-----------------------------------
-- Area: Port Windurst
-- NPC:  Shanruru
-- Involved in Quest: Riding on the Clouds
-- @zone 240
-- @pos -1 -6 187
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_4") == 5) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_4",0);
            player:tradeComplete();
            player:addKeyItem(SPIRITED_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SPIRITED_STONE);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    TruthJusticeOnionWay = player:getQuestStatus(WINDURST,TRUTH_JUSTICE_AND_THE_ONION_WAY);
    InspectorsGadget     = player:getQuestStatus(WINDURST,INSPECTOR_S_GADGET);
    OnionRings           = player:getQuestStatus(WINDURST,ONION_RINGS);

    if (player:getQuestStatus(WINDURST,THE_PROMISE) == QUEST_COMPLETED) then
        Message = math.random(0,1)
        
        if (Message == 1) then
            player:startEvent(0x0211);
        else
            player:startEvent(0x021d);
        end
    elseif (player:getQuestStatus(WINDURST,CRYING_OVER_ONIONS) == QUEST_ACCEPTED) then
        player:startEvent(0x01f8);
    elseif (OnionRings == QUEST_COMPLETED) then
        player:startEvent(0x01be);
    elseif (OnionRings == QUEST_ACCEPTED ) then
        player:startEvent(0x01b7);
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        player:startEvent(0x01ac);
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        player:startEvent(0x01a4);
    elseif (player:getQuestStatus(WINDURST,KNOW_ONE_S_ONIONS) == QUEST_COMPLETED) then
        player:startEvent(0x019c);
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then
        player:startEvent(0x0180);
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(0x0179);
    else
        player:startEvent(0x016f);
    end
   
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
end;