-----------------------------------
--
-- Zone: AlTaieu (33)
--
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/AlTaieu/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
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
        player:setPos(-25,-1 ,-620 ,33);
    end
    if (player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus") == 0) then
       cs=1;
    elseif (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus") == 0) then
      cs=167;
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
        player:setVar("PromathiaStatus",1);
        player:addKeyItem(LIGHT_OF_ALTAIEU);
        player:messageSpecial(KEYITEM_OBTAINED,LIGHT_OF_ALTAIEU);
        player:addTitle(SEEKER_OF_THE_LIGHT);
    elseif (csid == 167) then
        player:setVar("PromathiaStatus",1);
    end
end;
