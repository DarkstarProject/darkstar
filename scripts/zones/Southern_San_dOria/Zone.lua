-----------------------------------
--
-- Zone: Southern_San_dOria (230)
--
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/conquest");
require("scripts/globals/settings");
require("scripts/globals/chocobo")
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1, -292,-10,90 ,-258,10,105);
    applyHalloweenNpcCostumes(zone:getID())
    dsp.chocobo.initZone(zone)
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
        if (player:getMainJob() ~= player:getCharVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setCharVar("PlayerMainJob",0);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
    local regionID =region:GetRegionID();
    if (regionID==1 and player:getCurrentMission(COP) == dsp.mission.id.cop.DAWN and player:getCharVar("COP_louverance_story")== 2) then
        player:startEvent(758);
    end
end;

function onRegionLeave(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 503) then
        player:messageSpecial(ID.text.ITEM_OBTAINED,536);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(ID.text.HOMEPOINT_SET);
    elseif (csid == 758) then
        player:setCharVar("COP_louverance_story",3);
    end
end;