-----------------------------------
-- 
-- Zone: Dynamis-Tavnazia
-- 
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Dynamis-Tavnazia/TextIDs"] = nil;
require("scripts/zones/Dynamis-Tavnazia/TextIDs");

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
    local realDay = os.time();
    local dynaWaitxDay = player:getVar("dynaWaitxDay");
    
    if ((dynaWaitxDay + (BETWEEN_2DYNA_WAIT_TIME * 24 * 60 * 60)) < realDay or player:getVar("DynamisID") == GetServerVariable("[DynaTavnazia]UniqueID")) then
        if (player:isBcnmsFull() == 1) then
            if (player:hasStatusEffect(EFFECT_DYNAMIS, 0) == false) then
                inst = player:addPlayerToDynamis(1289);
                
                if (inst == 1) then
                    player:bcnmEnter(1289);
                else
                     cs = 0x0065;
                end
            else
                player:bcnmEnter(1289);
            end
        else
            inst = player:bcnmRegister(1289);
            
            if (inst == 1) then
                player:bcnmEnter(1289);
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
        player:setPos(0.0,-7,-23,195,26);
    end
end;



