-----------------------------------
-- 
-- Zone: Celennia Wexworth Memorial Library
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Celennia_Wexworth_Memorial_Library/TextIDs"] = nil;
require("scripts/zones/Celennia_Wexworth_Memorial_Library/TextIDs");

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
if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
player:setPos(-94,-2,-83,95);
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



