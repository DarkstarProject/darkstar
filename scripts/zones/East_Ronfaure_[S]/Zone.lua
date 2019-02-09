-----------------------------------
--
-- Zone: East_Ronfaure_[S] (81)
--
-----------------------------------
local ID = require("scripts/zones/East_Ronfaure_[S]/IDs")
require("scripts/globals/missions")
require("scripts/globals/helm")
require("scripts/globals/zone")
-----------------------------------

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.MYRADROSH)
    GetMobByID(ID.mob.MYRADROSH):setRespawnTime(math.random(5400, 7200))

    dsp.helm.initZone(zone, dsp.helm.type.LOGGING)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(86.131,-65.817,273.861,25);
    end
    if (prevZone == dsp.zone.SOUTHERN_SAN_DORIA_S) then
        if (player:getCurrentMission(WOTG) == WHILE_THE_CAT_IS_AWAY) then
            cs = 7;
        end
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 7) then
        player:completeMission(WOTG, WHILE_THE_CAT_IS_AWAY);
        player:addMission(WOTG, A_TIMESWEPT_BUTTERFLY);
    end
end;