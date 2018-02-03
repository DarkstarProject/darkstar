-----------------------------------
--
-- Zone: Stellar_Fulcrum
--
-----------------------------------
package.loaded["scripts/zones/Stellar_Fulcrum/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Stellar_Fulcrum/TextIDs");
-----------------------------------

function onInitialize(zone)

    zone:registerRegion(1, -522, -2, -49,  -517, -1, -43); -- To Upper Delkfutt's Tower
    zone:registerRegion(2, 318, -3, 2,  322, 1, 6); -- Exit BCNM to ?

end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)

    local cs = -1;

    if (player:getCurrentMission(ZILART) == RETURN_TO_DELKFUTTS_TOWER and player:getVar("ZilartStatus") == 2) then
        cs = 0;
    end

    return cs;

end;

function onRegionEnter(player,region)

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
            player:startEvent(8);
        end,
        [2] = function (x)
            player:startEvent(8);
        end,
    }

end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 8 and option == 1) then
        player:setPos(-370, -178, -40, 243, 0x9e);
    elseif (csid == 0) then
        player:setVar("ZilartStatus",3);
    end

end;