-----------------------------------
-- Area: Metalworks
--  NPC: Patt-Pott
-- Type: Consulate Representative
-- !pos 23 -17 42 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK and player:getVar("MissionStatus") == 5) then
        if (trade:hasItemQty(599,1) and trade:getItemCount() == 1) then -- Trade Mythril Sand
            player:startEvent(255);
        end
    end

end;

function onTrigger(player,npc)

    currentMission = player:getCurrentMission(WINDURST);
    MissionStatus = player:getVar("MissionStatus");

    if (currentMission == THE_THREE_KINGDOMS) then
        if (MissionStatus == 1) then
            player:startEvent(254);
        elseif (MissionStatus == 6) then
            player:startEvent(256);
        elseif (MissionStatus == 7) then
            player:startEvent(258);
        elseif (MissionStatus == 11) then
            player:startEvent(259);
        end
    elseif (currentMission == THE_THREE_KINGDOMS_BASTOK2) then
        if (MissionStatus == 11) then
            player:startEvent(257);
        else
            player:startEvent(258);
        end
    else
        player:startEvent(250);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 254) then
        player:addMission(WINDURST,THE_THREE_KINGDOMS_BASTOK);
        player:delKeyItem(LETTER_TO_THE_CONSULS_WINDURST);
        player:setVar("MissionStatus",3);
    elseif (csid == 256) then
        player:addMission(WINDURST,THE_THREE_KINGDOMS_BASTOK2);
        player:setVar("MissionStatus",8);
    elseif (csid == 257) then
        player:addMission(WINDURST,THE_THREE_KINGDOMS);
        player:delKeyItem(KINDRED_CREST);
        player:addKeyItem(KINDRED_REPORT);
        player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
    elseif (csid == 255) then
        player:tradeComplete();
        player:setVar("MissionStatus",7);
        player:addMission(WINDURST,THE_THREE_KINGDOMS);
    end

end;