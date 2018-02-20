-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: _5cb (Gate of Darkness)
-- !pos -228 0 99 192
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 9) then
        player:startEvent(75);
    else
        player:messageSpecial(DOOR_FIRMLY_CLOSED);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 75) then
        player:setVar("MissionStatus",10)
    end
end;