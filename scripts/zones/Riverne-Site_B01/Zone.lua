-----------------------------------
-- 
-- Zone: Riverne-Site_B01
-- 
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Riverne-Site_B01/TextIDs");
require("scripts/globals/status");
require("scripts/globals/settings");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------        
-- onConquestUpdate        
-----------------------------------        

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;


-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then    
        player:setPos(729.749,-20.319,407.153,90); -- {R}
    end
    -- ZONE LEVEL RESTRICTION
    if (ENABLE_COP_ZONE_CAP == 1) then
        player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,50,0,0);
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