-----------------------------------
--
-- Zone: Labyrinth_of_Onzozo (213)
--
-----------------------------------
package.loaded["scripts/zones/Labyrinth_of_Onzozo/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Labyrinth_of_Onzozo/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    local tomes = {17649898,17649899,17649900};
    
    SetGroundsTome(tomes);

    -- Mysticmaker Profblix
    SetRespawnTime(17649693, 900, 10800);
    
    UpdateTreasureSpawnPoint(17649896);
    
end;

-----------------------------------        
-- onZoneIn        
-----------------------------------        

function onZoneIn(player,prevZone)        
    local cs = -1;    
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then    
        player:setPos(-58.808,-21.364,-286.654,190);
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
