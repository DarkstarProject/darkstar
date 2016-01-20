-----------------------------------
--
-- Zone: Norg (252)
--
-----------------------------------
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Norg/TextIDs");

-----------------------------------
-- onInitialize
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
        player:setPos(-19.238,-2.163,-63.964,187);
    end
    if (player:getCurrentMission(ZILART) == THE_NEW_FRONTIER) then
        cs = 0x0001;
    elseif (player:getCurrentMission(ZILART) == AWAKENING and player:getVar("ZilartStatus") == 0 or player:getVar("ZilartStatus") == 2) then
        cs = 0x00B0;
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

    if (csid == 0x0001) then
        if (player:hasKeyItem(MAP_OF_NORG) == false) then
            player:addKeyItem(MAP_OF_NORG);
            player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_NORG);
        end
        player:completeMission(ZILART,THE_NEW_FRONTIER);
        player:addMission(ZILART,WELCOME_TNORG);
    elseif (csid == 0x00B0) then
        player:setVar("ZilartStatus", player:getVar("ZilartStatus")+1);
    end

end;