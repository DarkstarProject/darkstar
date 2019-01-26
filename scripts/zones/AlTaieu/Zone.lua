-----------------------------------
--
-- Zone: AlTaieu (33)
--
-----------------------------------
require("scripts/globals/settings");
local ID = require("scripts/zones/AlTaieu/IDs");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
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
end;

function onEventFinish(player,csid,option)
    if (csid == 1) then
        player:setVar("PromathiaStatus",1);
        player:addKeyItem(dsp.ki.LIGHT_OF_ALTAIEU);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.LIGHT_OF_ALTAIEU);
        player:addTitle(dsp.title.SEEKER_OF_THE_LIGHT);
    elseif (csid == 167) then
        player:setVar("PromathiaStatus",1);
    end
end;
