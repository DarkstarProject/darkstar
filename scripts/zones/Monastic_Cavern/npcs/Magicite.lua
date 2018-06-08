-----------------------------------
-- Area: Monastic Cavern
--  NPC: Magicite
-- Involved in Mission: Magicite
-- !pos -22 1 -66 150
-----------------------------------
package.loaded["scripts/zones/Monastic_Cavern/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Monastic_Cavern/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(player:getNation()) == 13 and player:hasKeyItem(dsp.ki.MAGICITE_OPTISTONE) == false) then
        if (player:getVar("MissionStatus") < 4) then
            player:startEvent(0,1,1,1,1,1,1,1,1); -- play Lion part of the CS (this is first magicite)
        else
            player:startEvent(0); -- don't play Lion part of the CS
        end
    else
        player:messageSpecial(THE_MAGICITE_GLOWS_OMINOUSLY);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 0) then
        player:setVar("MissionStatus",4);
        player:addKeyItem(dsp.ki.MAGICITE_OPTISTONE);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.MAGICITE_OPTISTONE);
    end

end;