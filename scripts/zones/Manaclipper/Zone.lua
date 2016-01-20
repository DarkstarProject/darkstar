-----------------------------------
--
-- Zone: Manaclipper
--
-----------------------------------
package.loaded["scripts/zones/Manaclipper/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Manaclipper/TextIDs");

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
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(0,-3,-8,60);
    end
    return cs;
end;


function onTransportEvent(player,transport)
  player:startEvent(0x0064);
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
   if (csid == 0x0064) then
    player:setPos(0,0,0,0,4);
   end
end;