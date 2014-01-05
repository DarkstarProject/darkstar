-----------------------------------
-- 
-- Zone: Feretory
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Marjami_Ravine/TextIDs"] = nil;
require("scripts/zones/Marjami_Ravine/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    player:setPos(-358.000, -3.400, -440.00, 63);
    cs = -1;

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



