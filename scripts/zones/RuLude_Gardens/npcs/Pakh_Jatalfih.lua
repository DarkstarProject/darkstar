-----------------------------------
-- Area: Ru'Lud Gardens
-- NPC:  Pakh Jatalfih
-- !pos 34 8 -35 243
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/RuLude_Gardens/TextIDs");
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

    local pNation = player:getNation();

    if (pNation == NATION_WINDURST) then
        currentMission = player:getCurrentMission(pNation);
        MissionStatus = player:getVar("MissionStatus");

        if (currentMission == A_NEW_JOURNEY and MissionStatus == 1) then
            player:startEvent(43);
        elseif (currentMission == A_NEW_JOURNEY and MissionStatus == 2) then
            player:startEvent(68);
        elseif (currentMission == A_NEW_JOURNEY and MissionStatus == 3) then
            player:startEvent(141);
        elseif (player:getRank() == 4 and MissionStatus == 0) then
            if (getMissionRankPoints(player,13) == 1) then
                player:startEvent(50);
            else
                player:startEvent(54);
            end
        elseif (player:getRank() == 4 and player:getCurrentMission(WINDURST) == 255 and MissionStatus ~= 0 and getMissionRankPoints(player,13) == 1) then
            player:startEvent(134);
        elseif (currentMission == MAGICITE and MissionStatus == 2) then
            player:startEvent(137);
        elseif (currentMission == MAGICITE and MissionStatus == 6) then
            player:startEvent(37);
        elseif (player:hasKeyItem(MESSAGE_TO_JEUNO_WINDURST)) then
            player:startEvent(57);
        elseif (player:getRank() >= 5) then
            player:startEvent(57);
        else
            player:startEvent(107);
        end
    elseif (pNation == NATION_SANDORIA) then
        player:startEvent(52);
    elseif (pNation == NATION_BASTOK) then
        player:startEvent(51);
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

    if (csid == 43) then
        player:setVar("MissionStatus",2);
    elseif (csid == 141) then
        player:setVar("MissionStatus",4);
    elseif (csid == 37) then
        finishMissionTimeline(player,1,csid,option);
    end

end;