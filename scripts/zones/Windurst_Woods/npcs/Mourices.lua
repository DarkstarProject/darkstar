-----------------------------------
-- Area: Windurst Woods
--  NPC: Mourices
-- Involved In Mission: Journey Abroad
-- !pos -50.646 -0.501 -27.642 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)

    local MissionStatus = player:getVar("MissionStatus");

    if (player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST and trade:hasItemQty(12298,2) and trade:getItemCount() == 2) then -- Trade 2 Parana Shield
        if (MissionStatus == 5) then
            player:startEvent(455); -- before deliver shield to the yagudo
        elseif (MissionStatus == 6) then
            player:startEvent(457); -- after deliver...Finish part of this quest
        end
    end

end;

function onTrigger(player,npc)

    local MissionStatus = player:getVar("MissionStatus");

    if (player:getCurrentMission(SANDORIA) == JOURNEY_ABROAD) then
        -- San d'Oria Mission 2-3 Part I - Windurst > Bastok
        if (MissionStatus == 2) then
            player:startEvent(448);
        elseif (MissionStatus == 7) then
            player:startEvent(458);
        -- San d'Oria Mission 2-3 Part II - Bastok > Windurst
        elseif (MissionStatus == 6) then
            player:startEvent(462);
        elseif (MissionStatus == 11) then
            player:startEvent(468);
        end
    -- San d'Oria Mission 2-3 Part I - Windurst > Bastok
    elseif (player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST) then
        if (MissionStatus >= 3 and MissionStatus <= 5) then
            player:startEvent(449);
        elseif (MissionStatus == 6) then
            player:startEvent(456);
        end
    -- San d'Oria Mission 2-3 Part II - Bastok > Windurst
    elseif (player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST2) then
        if (MissionStatus == 7 or MissionStatus == 8) then
            player:startEvent(463);
        elseif (MissionStatus == 9 or MissionStatus == 10) then
            player:startEvent(467);
        end
    else
        player:startEvent(441);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 448) then
        player:addMission(SANDORIA,JOURNEY_TO_WINDURST);
        player:setVar("MissionStatus",3);
        player:delKeyItem(LETTER_TO_THE_CONSULS_SANDORIA);
    elseif (csid == 457) then
        player:setVar("MissionStatus",7);
        player:tradeComplete();
        player:addMission(SANDORIA,JOURNEY_ABROAD);
    elseif (csid == 462) then
        player:addMission(SANDORIA,JOURNEY_TO_WINDURST2);
        player:setVar("MissionStatus",7);
    elseif (csid == 467) then
        player:addMission(SANDORIA,JOURNEY_ABROAD);
        player:delKeyItem(KINDRED_CREST);
        player:setVar("MissionStatus",11);
        player:addKeyItem(KINDRED_REPORT);
        player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
    end
end;
