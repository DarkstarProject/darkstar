-----------------------------------
-- Area: Hall of Transference
--  NPC: Large Apparatus (Right) - Holla
-- !pos -242.301 -1.849 269.867 14
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Hall_of_Transference/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getVar("HollaChipRegistration") == 0 and player:getVar("skyShortcut") == 1 and trade:hasItemQty(478,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        player:startEvent(166);
    end
end;

function onTrigger(player,npc)
    if (player:getVar("HollaChipRegistration") == 1) then
        player:messageSpecial(NO_RESPONSE_OFFSET+6); -- Device seems to be functioning correctly.
    else
        player:startEvent(165); -- Hexagonal Cones
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 166) then
        player:messageSpecial(NO_RESPONSE_OFFSET+4,478); -- You fit..
        player:messageSpecial(NO_RESPONSE_OFFSET+5);     -- Device has been repaired
        player:setVar("HollaChipRegistration",1);
    end
end;
