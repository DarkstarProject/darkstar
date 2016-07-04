-----------------------------------
-- 
-- Zone: Dynamis-Qufim
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Dynamis-Qufim/TextIDs"] = nil;
require("scripts/zones/Dynamis-Qufim/TextIDs");

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
cs = -1;
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then    
        player:setPos(-18,-17,104);
    end    
    
    local realDay = os.time();
    local dynaWaitxDay = player:getVar("dynaWaitxDay");
    
    if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or player:getVar("DynamisID") == GetServerVariable("[DynaQufim]UniqueID")) then
        if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToDynamis(1288);
                
                if (inst == 1) then
                    player:bcnmEnter(1288);
                else
                     cs = 0x0065;
                end
            else
                player:bcnmEnter(1288);
            end
        else
            inst = player:bcnmRegister(1288);
            
            if (inst == 1) then
                player:bcnmEnter(1288);
            else
                cs = 0x0065;
            end
        end
    else
        cs = 0x0065;
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
    if (csid == 0x0065) then
            player:setPos(18,-19,162,240, 126);
    end
end;



