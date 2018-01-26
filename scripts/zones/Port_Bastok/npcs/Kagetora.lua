-----------------------------------
-- Area: Port Bastok
--  NPC: Kagetora
-- Involved in Quest: Ayame and Kaede, 20 in Pirate Years
-- @zone 236
-- !pos -96 -2 29
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Port_Bastok/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK,AYAME_AND_KAEDE) == QUEST_ACCEPTED) then

        AyameAndKaede = player:getVar("AyameAndKaede_Event");

        if (AyameAndKaede == 0) then
            player:startEvent(241);
        elseif (AyameAndKaede > 2) then
            player:startEvent(244);
        else
            player:startEvent(23);
        end
    elseif (player:getVar("twentyInPirateYearsCS") == 1) then
        player:startEvent(261);
    else
        player:startEvent(23);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 241) then
        player:setVar("AyameAndKaede_Event",1);
    elseif (csid == 261) then
        player:setVar("twentyInPirateYearsCS",2);
    end

end;