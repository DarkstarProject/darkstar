-----------------------------------
-- Area: Altar Room
--  NPC: Magicite
-- Involved in Mission: Magicite
-- !pos -344 25 43 152
-----------------------------------
require("scripts/globals/keyitems");
local ID = require("scripts/zones/Altar_Room/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(player:getNation()) == 13 and player:hasKeyItem(dsp.ki.MAGICITE_ORASTONE) == false) then
        if (player:getVar("MissionStatus") < 4) then
            player:startEvent(44,1); -- play Lion part of the CS (this is first magicite)
        else
            player:startEvent(44); -- don't play Lion part of the CS
        end
    else
        player:messageSpecial(ID.text.THE_MAGICITE_GLOWS_OMINOUSLY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 44) then
        player:setVar("MissionStatus",4);
        player:addKeyItem(dsp.ki.MAGICITE_ORASTONE);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.MAGICITE_ORASTONE);
    end

end;