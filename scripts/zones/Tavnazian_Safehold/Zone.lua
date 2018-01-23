-----------------------------------
--
-- Zone: Tavnazian_Safehold (26)
--
-----------------------------------
package.loaded["scripts/zones/Tavnazian_Safehold/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Tavnazian_Safehold/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -5, -24, 18, 5, -20, 27);
    zone:registerRegion(2, 104, -42, -88, 113, -38, -77);
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(27.971,-14.068,43.735,66);
    end

    if (player:getCurrentMission(COP) == AN_INVITATION_WEST) then
        if (player:getVar("PromathiaStatus") == 1) then
            cs = 101;
        end
    elseif (player:getCurrentMission(COP) == SHELTERING_DOUBT and player:getVar("PromathiaStatus") == 0) then
        cs = 107;
    elseif (player:getCurrentMission(COP) == CHAINS_AND_BONDS and player:getVar("PromathiaStatus") == 1) then
        cs = 114;
    end

    return cs;
end;

function onRegionEnter(player,region)

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
            if (player:getCurrentMission(COP) == AN_ETERNAL_MELODY and player:getVar("PromathiaStatus") == 2) then
                player:startEvent(105);
            end
        end,
        [2] = function (x)
            if (player:getCurrentMission(COP) == SLANDEROUS_UTTERINGS and player:getVar("PromathiaStatus") == 0) then
                player:startEvent(112);
            end
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

    if (csid == 101) then
        player:completeMission(COP,AN_INVITATION_WEST);
        player:addMission(COP,THE_LOST_CITY);
        player:setVar("PromathiaStatus",0);
    elseif (csid == 105) then
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP,AN_ETERNAL_MELODY);
        player:addMission(COP,ANCIENT_VOWS);
    elseif (csid == 107) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 112) then
        player:setVar("PromathiaStatus",1);
    elseif (csid == 114) then
        player:setVar("PromathiaStatus",2);
    end

end;