-----------------------------------
--
-- Zone: The_Ashu_Talif
--
-----------------------------------

require("scripts/globals/settings");
local TheAshuTalif = require("scripts/zones/The_Ashu_Talif/IDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,target)
    -- printf("Zone Update CSID: %u",csid);
    -- printf("Zone Update RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("Zone Finish CSID: %u",csid);
    -- printf("Zone Finish RESULT: %u",option);

    if(csid == 102) then
        player:setPos(0,0,0,0,54);
    end
end;

