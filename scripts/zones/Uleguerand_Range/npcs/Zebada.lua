-----------------------------------
-- Area: Uleguerand Range
--  NPC: Zebada
-- Type: ENM Quest Activator
-- !pos -308.112 -42.137 -570.096 5
-----------------------------------
package.loaded["scripts/zones/Uleguerand_Range/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Uleguerand_Range/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Chamnaet Ice
    if (trade:hasItemQty(1780,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        player:startEvent(13);
    end
end;

function onTrigger(player,npc)

    local ZephyrFanCD = player:getVar("[ENM]ZephyrFan");

    if (player:hasKeyItem(ZEPHYR_FAN)) then
        player:startEvent(12);
    else
        if (ZephyrFanCD >= os.time()) then
            -- Both Vanadiel time and unix timestamps are based on seconds. Add the difference to the event.
            player:startEvent(15, VanadielTime()+(ZephyrFanCD-os.time()));
        else
            if (player:hasItem(1780) or player:hasItem(1779)) then -- Chamnaet Ice -- Cotton Pouch
                player:startEvent(16);
            else
                player:startEvent(14);
            end;
        end;
    end;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 13) then
        player:addKeyItem(ZEPHYR_FAN);
        player:messageSpecial(KEYITEM_OBTAINED,ZEPHYR_FAN);
        player:setVar("[ENM]ZephyrFan",os.time()+(ENM_COOLDOWN*3600)); -- Current time + (ENM_COOLDOWN*1hr in seconds)
    elseif (csid == 14) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1779); -- Cotton Pouch
            return;
        else
            player:addItem(1779);
            player:messageSpecial(ITEM_OBTAINED, 1779); -- Cotton Pouch
        end
    end
end;
