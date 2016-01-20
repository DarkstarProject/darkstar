-----------------------------------
-- 
-- Zone: Ship_bound_for_Selbina (220)
-- 
-----------------------------------
package.loaded["scripts/zones/Ship_bound_for_Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Ship_bound_for_Selbina/TextIDs");

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
    
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        local position = math.random(-2,2) + 0.150;    
        player:setPos(position,-2.100,3.250,64);
    end
    
    if (player:hasKeyItem(SEANCE_STAFF) and player:getVar("Enagakure_Killed") == 0) then
        SpawnMob(17678351,600);
    end
    
    return cs;

end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
    player:startEvent(0x00ff);
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
    if (csid == 0x00ff) then
        player:setPos(0,0,0,0,248);
    end
end;