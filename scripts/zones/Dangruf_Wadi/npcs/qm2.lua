-----------------------------------
-- Area: Dangruf Wadi
--  NPC: ??? (QM2)
-- Type: Item Giver
-- !pos -120.041 2.621 415.989 191
-- Starts and Finishes: Breaking Stones, An Empty Vessel
-- only spawns if the weather is SUNNY or CLEAR
-----------------------------------
package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Dangruf_Wadi/TextIDs");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(110);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
     -- printf("CSID: %u",csid);
     -- printf("RESULT: %u",option);

    if (csid == 110 and option == 0) then
        if (player:getFreeSlotsCount() > 0) then
            if (player:addItem(553)) then
                player:messageSpecial(ITEM_OBTAINED,553);
            end
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,553);
        end
    end
end;
