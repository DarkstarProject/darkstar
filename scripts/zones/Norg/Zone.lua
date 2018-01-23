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

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)

    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-19.238,-2.163,-63.964,187);
    end
    if (player:getCurrentMission(ZILART) == THE_NEW_FRONTIER) then
        cs = 1;
    elseif (player:getCurrentMission(ZILART) == AWAKENING and player:getVar("ZilartStatus") == 0 or player:getVar("ZilartStatus") == 2) then
        cs = 176;
    end

    return cs;

end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 1) then
        if (player:hasKeyItem(MAP_OF_NORG) == false) then
            player:addKeyItem(MAP_OF_NORG);
            player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_NORG);
        end
        player:completeMission(ZILART,THE_NEW_FRONTIER);
        player:addMission(ZILART,WELCOME_TNORG);
    elseif (csid == 176) then
        player:setVar("ZilartStatus", player:getVar("ZilartStatus")+1);
    end

end;