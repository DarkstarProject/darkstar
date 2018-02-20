-----------------------------------
--
-- Zone: The_Shrouded_Maw (10)
--
-----------------------------------
package.loaded["scripts/zones/The_Shrouded_Maw/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/The_Shrouded_Maw/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-300,-1.5,-220,62);
    end
    if (player:getCurrentMission(COP) == DARKNESS_NAMED  and  player:getVar("PromathiaStatus") == 1) then
        cs =2;
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 2) then
        player:setVar("PromathiaStatus",2);
    end
end;