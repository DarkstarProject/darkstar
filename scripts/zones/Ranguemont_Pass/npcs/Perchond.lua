-----------------------------------
--  Area: Ranguemont Pass
--  NPC:  Perchond
--  @pos -182.844 4 -164.948 166
-----------------------------------
package.loaded["scripts/zones/Ranguemont_Pass/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(1107,1) and trade:getItemCount() == 1) then -- glitter sand
        local SinHunting = player:getVar("sinHunting");    -- RNG AF1
        if (SinHunting == 2) then
            player:startEvent(0x0005);
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local SinHunting = player:getVar("sinHunting");    -- RNG AF1

    if (SinHunting == 1) then
        player:startEvent(0x0003, 0, 1107);
    else
        player:startEvent(0x0002);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

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

