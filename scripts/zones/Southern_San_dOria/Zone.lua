-----------------------------------
--
-- Zone: Southern_San_dOria (230)
--
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/zone");
require("scripts/globals/settings");
require("scripts/zones/Southern_San_dOria/TextIDs");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -292,-10,90 ,-258,10,105);
    applyHalloweenNpcCostumes(zone:getID())
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            cs = 503;
        end
        player:setPos(-96,1,-40,224);
        player:setHomePoint();
    end
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(161,-2,161,94);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setVar("PlayerMainJob",0);
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
    local regionID =region:GetRegionID();
    if (regionID==1 and player:getCurrentMission(COP) == DAWN and player:getVar("COP_louverance_story")== 2) then
        player:startEvent(758);
    end
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
    if (csid == 503) then
        player:messageSpecial(ITEM_OBTAINED,0x218);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 758) then
        player:setVar("COP_louverance_story",3);
    end
end;