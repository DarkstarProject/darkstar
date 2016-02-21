-----------------------------------
--
-- Zone: The_Eldieme_Necropolis (195)
--
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    local tomes = {17576425,17576426,17576427,17576428};
    
    SetGroundsTome(tomes);

    UpdateTreasureSpawnPoint(17576352);
    
    UpdateTreasureSpawnPoint(17576353);

end;

-----------------------------------        
-- onZoneIn        
-----------------------------------        

function onZoneIn(player,prevZone)        
    
    -- rng af2
    local FireAndBrimstoneCS = player:getVar("fireAndBrimstone");    
    if (FireAndBrimstoneCS == 2) then
        return 4;
    end
    
    local cs = -1;    
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then    
        player:setPos(-438.878,-26.091,540.004,126);
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
    
    if (csid == 4) then
        player:setVar("fireAndBrimstone",3);        
    end
    
end;    
