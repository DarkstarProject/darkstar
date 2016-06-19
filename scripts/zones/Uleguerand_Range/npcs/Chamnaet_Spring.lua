-----------------------------------
--  Area: Uleguerand Range
--  NPC:  Chamnaet Spring
--  Type: ENM Quest Activator
--  @pos -308.112 -42.137 -570.096 5
-----------------------------------
package.loaded["scripts/zones/Uleguerand_Range/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Cotton Pouch
    if (trade:hasItemQty(1779,1) and trade:getItemCount() == 1) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1780); -- Chamnaet Ice
        else
            player:tradeComplete();
            player:addItem(1780);
            player:messageSpecial(ITEM_OBTAINED, 1780); -- Chamnaet Ice
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
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
end;

