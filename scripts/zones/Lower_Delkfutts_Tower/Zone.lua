-----------------------------------
--
-- Zone: Lower_Delkfutts_Tower (184)
--
-----------------------------------
package.loaded["scripts/zones/Lower_Delkfutts_Tower/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/globals/missions");
require("scripts/zones/Lower_Delkfutts_Tower/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, 403, -34, 83, 409, -33, 89); -- Third Floor G-6 porter to Middle Delkfutt's Tower
    zone:registerRegion(2, 390, -34, -49, 397, -33, -43); -- Third Floor F-10 porter to Middle Delkfutt's Tower "1"
end;

-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)

    local cs = -1;

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(460.022,-1.77,-103.442,188);
    end
    if (player:getCurrentMission(ZILART) == RETURN_TO_DELKFUTTS_TOWER and player:getVar("ZilartStatus") <= 1) then
        cs = 15;
    elseif (ENABLE_COP == 1 and prevZone == 126 and player:getCurrentMission(COP) == ANCIENT_FLAMES_BECKON) then
        cs = 22;
    elseif (player:getCurrentMission(ACP) == BORN_OF_HER_NIGHTMARES and prevZone == 126) then
        cs = 34;
    end

    return cs;

end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)

    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)
            player:setVar("option",1);
            player:startEvent(4);
        end,
        [2] = function (x)
            player:setVar("option",2);
            player:startEvent(4);
        end,
    }

end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
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

    if (csid == 15) then
        player:setVar("ZilartStatus",2);
    elseif (csid == 4 and option == 1) then
        if (player:getVar("option") == 1) then
            player:setPos(-28, -48, 80, 111, 157);
        else
            player:setPos(-51, -48, -40, 246, 157);
        end
        player:setVar("option",0);
    elseif (csid == 4 and (option == 0 or option >= 3)) then
        player:setVar("option",0);
    elseif (csid == 22) then
        player:startEvent(36);
    elseif (csid == 34) then
        player:completeMission(ACP,BORN_OF_HER_NIGHTMARES);
        player:addMission(ACP,BANISHING_THE_ECHO);
    elseif (csid == 36) then
        player:startEvent(37);
    elseif (csid == 37) then
        player:startEvent(38);
    elseif (csid == 38) then
         player:startEvent(39);
    elseif (csid == 39) then
        player:completeMission(COP,ANCIENT_FLAMES_BECKON);
        player:addMission(COP,THE_RITES_OF_LIFE);
        player:setVar("COP1",1);
    end
end;