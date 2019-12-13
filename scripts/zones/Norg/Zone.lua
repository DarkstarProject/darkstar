-----------------------------------
--
-- Zone: Norg (252)
--
-----------------------------------
local ID = require("scripts/zones/Norg/IDs")
require("scripts/globals/conquest")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/chocobo")
-----------------------------------

function onInitialize(zone)
    dsp.chocobo.initZone(zone)
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)

    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-19.238,-2.163,-63.964,187);
    end
    if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_NEW_FRONTIER) then
        cs = 1;
    elseif (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.AWAKENING and player:getCharVar("ZilartStatus") == 0 or player:getCharVar("ZilartStatus") == 2) then
        cs = 176;
    end

    return cs;

end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 1) then
        if (player:hasKeyItem(dsp.ki.MAP_OF_NORG) == false) then
            player:addKeyItem(dsp.ki.MAP_OF_NORG);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MAP_OF_NORG);
        end
        player:completeMission(ZILART,dsp.mission.id.zilart.THE_NEW_FRONTIER);
        player:addMission(ZILART,dsp.mission.id.zilart.WELCOME_TNORG);
    elseif (csid == 176) then
        player:addCharVar("ZilartStatus", 1);
    end

end;