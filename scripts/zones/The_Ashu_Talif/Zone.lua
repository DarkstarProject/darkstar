-----------------------------------
-- 
-- Zone: The_Ashu_Talif
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/The_Ashu_Talif/TextIDs"] = nil;
require("scripts/zones/The_Ashu_Talif/IDs");
require("scripts/zones/The_Ashu_Talif/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onInstanceZoneIn
-----------------------------------

function onInstanceZoneIn(player,prevZone)
-- cs = -1;

   --  local pos = player:getPos();
    -- if (pos.x == 0 and pos.y == 0 and pos.z == 0) then
       --  local entrypos = instance:getEntryPos();
        player:setPos(0,-22,25,66);
		
    -- end

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



