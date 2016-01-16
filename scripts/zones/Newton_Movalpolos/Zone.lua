-----------------------------------
--
-- Zone: Newton_Movalpolos (12)
--
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Newton_Movalpolos/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    UpdateTreasureSpawnPoint(16826623);

end;

-----------------------------------        
-- onZoneIn        
-----------------------------------        

function onZoneIn(player,prevZone)        
    local cs = -1;    
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then    
        player:setPos(451.895,26.214,-19.782,133);
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
