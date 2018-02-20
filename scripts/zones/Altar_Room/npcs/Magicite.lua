-----------------------------------
-- Area: Altar Room
--  NPC: Magicite
-- Involved in Mission: Magicite
-- !pos -344 25 43 152
-----------------------------------
package.loaded["scripts/zones/Altar_Room/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Altar_Room/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(player:getNation()) == 13 and player:hasKeyItem(MAGICITE_ORASTONE) == false) then
        if (player:getVar("MissionStatus") < 4) then
            player:startEvent(44,1); -- play Lion part of the CS (this is first magicite)
        else
            player:startEvent(44); -- don't play Lion part of the CS
        end
    else
        player:messageSpecial(THE_MAGICITE_GLOWS_OMINOUSLY);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 44) then
        player:setVar("MissionStatus",4);
        player:addKeyItem(MAGICITE_ORASTONE);
        player:messageSpecial(KEYITEM_OBTAINED,MAGICITE_ORASTONE);
    end

end;