-----------------------------------
--
-- Zone: Bastok_Markets (235)
--
-----------------------------------
require("scripts/globals/events/harvest_festivals");
require("scripts/globals/settings");
require("scripts/globals/zone");
local ID = require("scripts/zones/Bastok_Markets/IDs");
-----------------------------------

function onInitialize(zone)
    applyHalloweenNpcCostumes(zone:getID())
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    -- FIRST LOGIN (START CS)
    if (player:getPlaytime(false) == 0) then
        if (OPENING_CUTSCENE_ENABLE == 1) then
            --cs = 0;
        end
        player:setPos(-280,-12,-91,15);
        player:setHomePoint();
    end
    -- MOG HOUSE EXIT
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        position = math.random(1,5) - 33;
        player:setPos(-177,-8,position,127);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 30004;
        end
        player:setVar("PlayerMainJob",0);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onGameDay()
    -- Removes daily the bit mask that tracks the treats traded for Harvest Festival.
    if (isHalloweenEnabled() ~= 0) then
        clearVarFromAll("harvestFestTreats");
        clearVarFromAll("harvestFestTreats2");
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 0) then
        player:messageSpecial(ID.text.ITEM_OBTAINED,536);
    elseif (csid == 30004 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(ID.text.HOMEPOINT_SET);
    end
end;