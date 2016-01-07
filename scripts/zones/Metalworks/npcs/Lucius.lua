-----------------------------------
-- Area: Metalworks
-- NPC:  Lucius
-- Involved in Mission: Bastok 3-3
-- Involved in Quest: Riding on the Clouds
-- @pos 59.959 -17.39 -42.321 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 8) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(SMILING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getCurrentMission(BASTOK) == JEUNO_MISSION and player:getVar("MissionStatus") == 0) then
        player:startEvent(0x0142);
    else
        player:startEvent(0x0140);
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
    
    if (csid == 0x0142) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(LETTER_TO_THE_AMBASSADOR);
        player:messageSpecial(KEYITEM_OBTAINED,LETTER_TO_THE_AMBASSADOR);
    end
    
end;