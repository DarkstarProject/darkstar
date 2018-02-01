-----------------------------------
-- Area: Kazham
--  NPC: Jakoh Wahcondalo
-- !pos 101 -16 -115 250
-----------------------------------
package.loaded["scripts/zones/Kazham/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Kazham/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ZILART) == KAZAMS_CHIEFTAINESS) then
        player:startEvent(114);
    elseif (player:getCurrentMission(ZILART) == THE_TEMPLE_OF_UGGALEPIH) then
        player:startEvent(115);
    elseif (player:getCurrentMission(WINDURST) == AWAKENING_OF_THE_GODS and player:getVar("MissionStatus") == 2) then
        player:startEvent(265);
    else
        player:startEvent(113);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 114) then
        player:addKeyItem(SACRIFICIAL_CHAMBER_KEY);
        player:messageSpecial(KEYITEM_OBTAINED,SACRIFICIAL_CHAMBER_KEY);
        player:completeMission(ZILART,KAZAMS_CHIEFTAINESS);
        player:addMission(ZILART,THE_TEMPLE_OF_UGGALEPIH);
    elseif (csid == 265) then
        player:setVar("MissionStatus",3);
    end

end;
