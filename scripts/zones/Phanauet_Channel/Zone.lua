-----------------------------------
--
-- Zone: Phanauet_Channel
--
-----------------------------------
package.loaded["scripts/zones/Phanauet_Channel/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Phanauet_Channel/TextIDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        local position = math.random(-2,2) + 0.15;
        player:setPos(position, -2.000, -1.000, 190);
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
end;

