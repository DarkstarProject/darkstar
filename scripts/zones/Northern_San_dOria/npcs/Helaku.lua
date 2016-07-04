-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Helaku
-- Involved in Missions 2-3
-- @zone 231
-- @pos 49 -2 -12
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local currentMission = player:getCurrentMission(BASTOK);
    local missionStatus = player:getVar("MissionStatus");

    if (currentMission == THE_EMISSARY) then
        -- Bastok Mission 2-3 Part I - San d'Oria > Windurst
        if (missionStatus == 1) then
            player:startEvent(676);
        elseif (missionStatus == 2) then
            player:startEvent(536);
        elseif (missionStatus == 3) then
            player:showText(npc,HELAKU_DIALOG);
        -- Bastok Mission 2-3 Part II - Windurst > San d'Oria
        elseif (missionStatus == 7) then
            player:startEvent(537);
        elseif (missionStatus == 11) then
            player:startEvent(557);
        end
    -- Bastok Mission 2-3 Part I - San d'Oria > Windurst
    elseif (currentMission == THE_EMISSARY_SANDORIA) then
        if (missionStatus <= 4) then
            player:startEvent(542);
        else
            player:startEvent(543);
        end
    -- Bastok Mission 2-3 Part II - Windurst > San d'Oria
    elseif (currentMission == THE_EMISSARY_SANDORIA2) then
        missionStatus = player:getVar("MissionStatus");
        if (missionStatus == 7) then
            player:startEvent(537);
        elseif (missionStatus == 9) then
            player:startEvent(542);
        elseif (player:hasKeyItem(KINDRED_CREST)) then
            player:startEvent(545);
        end
    else
        player:startEvent(541);
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

    if (csid == 536) then
        player:setVar("MissionStatus",3);
    elseif (csid == 543) then
        player:addMission(BASTOK,THE_EMISSARY);
        player:setVar("MissionStatus",6);
    elseif (csid == 537 and option == 0) then
        player:addMission(BASTOK,THE_EMISSARY_SANDORIA2);
        player:setVar("MissionStatus",8);
    elseif (csid == 545) then
        player:addMission(BASTOK,THE_EMISSARY);
        player:setVar("MissionStatus",11);
        player:addKeyItem(KINDRED_REPORT);
        player:messageSpecial(KEYITEM_OBTAINED,KINDRED_REPORT);
        player:delKeyItem(KINDRED_CREST);
    end
end;