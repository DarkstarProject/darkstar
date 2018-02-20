-----------------------------------
-- Area: Lower Jeuno
--  NPC: Muckvix
-- Involved in Mission: Magicite
-- @zone 245
-- !pos -26.824 3.601 -137.082
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Lower_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(SILVER_BELL) and player:hasKeyItem(YAGUDO_TORCH) == false) then
        if (player:getVar("YagudoTorchCS") == 1) then
            player:startEvent(184);
        else
            player:startEvent(80);
        end
    else
        player:startEvent(15);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 184) then
        player:addKeyItem(YAGUDO_TORCH);
        player:messageSpecial(KEYITEM_OBTAINED,YAGUDO_TORCH);
        player:setVar("YagudoTorchCS",0);
    end

end;