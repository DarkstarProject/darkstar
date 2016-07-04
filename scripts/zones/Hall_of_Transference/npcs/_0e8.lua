-----------------------------------
-- Area: Hall of Transference
--  NPC: Large Apparatus (Right) - Mea
-- @pos 290.253 -81.849 -42.381 14
-----------------------------------
package.loaded["scripts/zones/Hall_of_Transference/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Hall_of_Transference/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getVar("MeaChipRegistration") == 0 and player:getVar("skyShortcut") == 1 and trade:hasItemQty(478,1) and trade:getItemCount() == 1) then
        player:tradeComplete(); 
        player:startEvent(0x00A4);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getVar("MeaChipRegistration") == 1) then
        player:messageSpecial(NO_RESPONSE_OFFSET+6); -- Device seems to be functioning correctly. 
    else
        player:startEvent(0x00A3); -- Hexagonal Cones
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
    if (csid == 0x00A4) then
        player:messageSpecial(NO_RESPONSE_OFFSET+4,478); -- You fit.. 
        player:messageSpecial(NO_RESPONSE_OFFSET+5);     -- Device has been repaired
        player:setVar("MeaChipRegistration",1); 
    end
end;
