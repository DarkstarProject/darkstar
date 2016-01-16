-----------------------------------
--
-- Zone: Crawlers_Nest (197)
--
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Crawlers_Nest/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    local tomes = {17584492,17584493};
    
    SetGroundsTome(tomes);

    UpdateTreasureSpawnPoint(17584471);
    
    UpdateTreasureSpawnPoint(17584472);

    
end;

-----------------------------------        
-- onZoneIn        
-----------------------------------        

function onZoneIn(player,prevZone)        
    local cs = -1;    
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then    
        player:setPos(380.617,-34.61,4.581,59);
    end    
    return cs;    
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
