-----------------------------------
--
-- Zone: The_Boyahda_Tree (153)
--
-----------------------------------
local ID = require("scripts/zones/The_Boyahda_Tree/IDs")
require("scripts/globals/conquest")
-----------------------------------

function onInitialize(zone)
    UpdateTreasureSpawnPoint(ID.npc.BOYAHDA_TREASURE_COFFER);
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(-140.008,3.787,202.715,64);
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
