-----------------------------------
--  Area: Windurst Waters (S)
--   NPC: Door
-- @zone: 94

-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("TheLostBook") == 1) then
    player:startEvent(145);
    end
end;
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:hasKeyItem(972) and trade:hasItemQty(2550,1)) then
    player:startEvent(146);
    end


end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 145) then
    player:setVar("TheLostBook",2);
    elseif (csid == 146) then
    player:addItem(4873);
    player:messageSpecial(ITEM_OBTAINED,4873);
    end
end;
