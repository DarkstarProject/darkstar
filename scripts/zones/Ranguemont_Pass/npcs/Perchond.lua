-----------------------------------
-- Area: Ranguemont Pass
--  NPC: Perchond
-- !pos -182.844 4 -164.948 166
-----------------------------------
package.loaded["scripts/zones/Ranguemont_Pass/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(1107,1) and trade:getItemCount() == 1) then -- glitter sand
        local SinHunting = player:getVar("sinHunting");    -- RNG AF1
        if (SinHunting == 2) then
            player:startEvent(5);
        end
    end

end;

function onTrigger(player,npc)

    local SinHunting = player:getVar("sinHunting");    -- RNG AF1

    if (SinHunting == 1) then
        player:startEvent(3, 0, 1107);
    else
        player:startEvent(2);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 3) then
        player:setVar("sinHunting",2);
    elseif (csid == 5) then
        player:tradeComplete();
        player:addKeyItem(PERCHONDS_ENVELOPE);
        player:messageSpecial(KEYITEM_OBTAINED,PERCHONDS_ENVELOPE);
        player:setVar("sinHunting",3);
    end

end;

