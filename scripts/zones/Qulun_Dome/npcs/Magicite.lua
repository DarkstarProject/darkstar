-----------------------------------
-- Area: Qulun Dome
--  NPC: Magicite
-- Involved in Mission: Magicite
-- !pos 11 25 -81 148
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Qulun_Dome/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(player:getNation()) == 13 and player:hasKeyItem(dsp.ki.MAGICITE_AURASTONE) == false) then
        if (player:getVar("MissionStatus") < 4) then
            player:startEvent(0,1); -- play Lion part of the CS (this is first magicite)
        else
            player:startEvent(0); -- don't play Lion part of the CS
        end
    else
        player:messageSpecial(ID.text.THE_MAGICITE_GLOWS_OMINOUSLY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 0) then
        player:setVar("MissionStatus",4);
        player:addKeyItem(dsp.ki.MAGICITE_AURASTONE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MAGICITE_AURASTONE);
    end

end;