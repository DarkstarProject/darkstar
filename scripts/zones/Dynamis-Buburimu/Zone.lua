-----------------------------------
--
-- Zone: Dynamis-Buburimu
--
-----------------------------------
local ID = require("scripts/zones/Dynamis-Buburimu/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = 0;
    local inst = 0;

    if player:isBcnmsFull() == 1 then
        -- run currently in progress
        -- add player to the run if they entered via markings, or if they reconnected to a run they were previously in
        -- gms will be automatically registered
        if player:getVar("enteringDynamis") == 1 or player:getVar("DynamisID") == GetServerVariable("[DynaBuburimu]UniqueID") or player:getGMLevel() > 0 then
            inst = player:addPlayerToDynamis(1287);
        end
    else
        -- no run yet in progress
        -- register run by player if they entered via markings
        -- gms will be automatically registered
        if player:getVar("enteringDynamis") == 1 or player:getGMLevel() > 0 then
            inst = player:bcnmRegister(1287);
        end
    end

    if inst == 1 then
        player:bcnmEnter(1287);
        cs = -1;
        if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
            player:setPos(155,-1,-169,170);
        end
    end

    player:setVar("enteringDynamis",0);
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 0) then
        player:setPos(154,-1,-170,190, 118);
    end
end;
