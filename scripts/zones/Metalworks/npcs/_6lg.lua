-----------------------------------
-- Area: Metalworks
-- Door: _6lg (Cornelia's Room)
-- !pos 114 -20 -7 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasCompletedMission(BASTOK,ON_MY_WAY) and player:getVar("[B7-2]Cornelia") == 0) then
        player:startEvent(622);
    else
        player:messageSpecial(ITS_LOCKED);
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

    if (csid == 622) then
        player:setVar("[B7-2]Cornelia", 1);
    end

end;