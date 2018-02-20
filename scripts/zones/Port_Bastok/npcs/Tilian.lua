-----------------------------------
-- Area: Port Bastok
--  NPC: Tilian
-- Type: Quest NPC
-- !pos -118.460 4.999 -68.090 236
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Bastok/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,4) == false) then
        player:startEvent(353);
    else
        player:startEvent(100);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 353) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",4,true);
    end
end;
