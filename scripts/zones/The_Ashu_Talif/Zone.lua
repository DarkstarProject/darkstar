-----------------------------------
--
-- Zone: The_Ashu_Talif
--
-----------------------------------
require("scripts/globals/settings");
local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option,target)
    -- printf("Zone Update CSID: %u",csid);
    -- printf("Zone Update RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("Zone Finish CSID: %u",csid);
    -- printf("Zone Finish RESULT: %u",option);

    if(csid == 101 or csid == 102) then
        player:setPos(0,0,0,0,54);
    end
end;

