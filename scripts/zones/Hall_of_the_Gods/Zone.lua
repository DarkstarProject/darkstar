-----------------------------------
--
-- Zone: Hall_of_the_Gods (251)
--
-----------------------------------
package.loaded["scripts/zones/Hall_of_the_Gods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Hall_of_the_Gods/TextIDs");

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
        player:setPos(-0.011,-1.848,-176.133,192);
    elseif (player:getCurrentMission(ACP) == REMEMBER_ME_IN_YOUR_DREAMS and prevZone == 122) then
        cs = 0x0005;
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
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0005) then
        player:completeMission(ACP,REMEMBER_ME_IN_YOUR_DREAMS);
        player:addMission(ACP,BORN_OF_HER_NIGHTMARES);
    end
end;