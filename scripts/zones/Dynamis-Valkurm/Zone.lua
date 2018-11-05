-----------------------------------
--
-- Zone: Dynamis-Valkurm
--
-----------------------------------
local ID = require("scripts/zones/Dynamis-Valkurm/IDs")
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
        if player:getVar("enteringDynamis") == 1 or player:getVar("DynamisID") == GetServerVariable("[DynaValkurm]UniqueID") or player:getGMLevel() > 0 then
            inst = player:addPlayerToDynamis(1286);
        end
    else
        -- no run yet in progress
        -- register run by player if they entered via markings
        -- gms will be automatically registered
        if player:getVar("enteringDynamis") == 1 or player:getGMLevel() > 0 then
            inst = player:bcnmRegister(1286);
        end
    end

    if inst == 1 then
        player:bcnmEnter(1286);
        cs = -1;
        if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
            player:setPos(100,-8,131,47);
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
        player:setPos(117,-9,132,162,103);
    end
end;
