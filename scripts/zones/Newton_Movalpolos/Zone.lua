-----------------------------------
--
-- Zone: Newton_Movalpolos (12)
--
-----------------------------------
local ID = require("scripts/zones/Newton_Movalpolos/IDs");
require("scripts/globals/conquest");
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(ID.mob.NEWTON_TREASURE_COFFER);
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(451.895,26.214,-19.782,133);
    end
    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
