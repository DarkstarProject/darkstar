-----------------------------------
-- 
-- Zone: Lebros_Cavern
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Lebros_Cavern/TextIDs"] = nil;
require("scripts/zones/Lebros_Cavern/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    cs = -1;
    
    local pos = player:getPos();
    if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
        player:setPos(player:getInstance():getEntryPos());
    end
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

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onInstanceFailure
-----------------------------------

function onInstanceLoadFailed()
    return 61;
end;