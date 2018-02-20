-----------------------------------
-- Area: Hall of Transference
--  NPC: Large Apparatus (Right) - Dem
-- !pos -243.723 -41.482 -289.937 14
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Hall_of_Transference/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getVar("DemChipRegistration") == 0 and player:getVar("skyShortcut") == 1 and trade:hasItemQty(478,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        player:startEvent(168);
    end
end;

function onTrigger(player,npc)
    if (player:getVar("DemChipRegistration") == 1) then
        player:messageSpecial(NO_RESPONSE_OFFSET+6); -- Device seems to be functioning correctly.
    else
        player:startEvent(167); -- Hexagonal Cones
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 168) then
        player:messageSpecial(NO_RESPONSE_OFFSET+4,478); -- You fit..
        player:messageSpecial(NO_RESPONSE_OFFSET+5);     -- Device has been repaired
        player:setVar("DemChipRegistration",1);
    end
end;
