-----------------------------------
--
-- Zone: Bastok_Mines (234)
--
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/zone");
require("scripts/globals/settings");
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/titles");
-----------------------------------

function onInitialize(zone)
    SetExplorerMoogles(17735856);

    applyHalloweenNpcCostumes(zone:getID())
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 1;
        end
        player:setPos(-45,-0,26,213);
        player:setHomePoint();
    end
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        position = math.random(1,5) - 75;
        player:setPos(116,0.99,position,127);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setVar("PlayerMainJob",0);
    end
    if (prevZone == 172) then
        if (player:getCurrentMission(BASTOK) == ENTER_THE_TALEKEEPER and player:getVar("MissionStatus") == 5) then
            cs = 176
        end
    end -- this if was leaking into the other functions

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
    if (csid == 1) then
        player:messageSpecial(ITEM_OBTAINED,0x218);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 176) then
        finishMissionTimeline(player,1,csid,option);
    end -- you're not useing the script i sent youuu
end;
