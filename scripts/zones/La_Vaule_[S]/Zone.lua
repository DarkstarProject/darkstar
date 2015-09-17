-----------------------------------
--
-- Zone: La_Vaule_[S] (85)
--
-----------------------------------
package.loaded["scripts/zones/La_Vaule_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/La_Vaule_[S]/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/missions");
-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------     
-- onZoneIn     
-----------------------------------     

function onZoneIn(player,prevZone)      
    local cs = -1;  
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then   
        player:setPos(236.547,-2.25,20,120);
    end
    if (prevZone == 82) then
        if (player:getCurrentMission(WOTG) == A_TIMESWEPT_BUTTERFLY) then
            cs = 0x0001;
        end
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;    

----------------------------------- 
-- onEventFinish    
----------------------------------- 

function onEventFinish(player,csid,option)  
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0001) then
        player:completeMission(WOTG, A_TIMESWEPT_BUTTERFLY);
        player:addMission(WOTG, PURPLE,_THE_NEW_BLACK);
    end
end;    