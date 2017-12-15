-----------------------------------
-- Area: Upper Jeuno
--  NPC: Paya-Sabya
-- Involved in Mission: Magicite
-- @zone 244
-- !pos 9 1 70
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(SILVER_BELL) and player:hasKeyItem(YAGUDO_TORCH) == false and player:getVar("YagudoTorchCS") == 0) then
        player:startEvent(80);
    else
        player:startEvent(79);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 80) then
        player:setVar("YagudoTorchCS",1);
    end

end;