-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: _5ci (Gate of Light)
--  Involved In Mission: 3-2
-- !pos -331 0 139 192
-----------------------------------
package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(WINDURST) == WRITTEN_IN_THE_STARS and player:getVar("MissionStatus") == 1) then
        player:startEvent(41,0,CHARM_OF_LIGHT);
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

    if (csid == 41) then
        player:setVar("MissionStatus",2);
        player:delKeyItem(CHARM_OF_LIGHT);
    end

end;