-----------------------------------
-- Area: Hall of Transference
--  NPC: Large Apparatus (Right) - Mea
-- !pos 290.253 -81.849 -42.381 14
-----------------------------------
local ID = require("scripts/zones/Hall_of_Transference/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getVar("MeaChipRegistration") == 0 and player:getVar("skyShortcut") == 1 and trade:hasItemQty(478,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        player:startEvent(164);
    end
end;

function onTrigger(player,npc)
    if (player:getVar("MeaChipRegistration") == 1) then
        player:messageSpecial(ID.text.NO_RESPONSE_OFFSET+6); -- Device seems to be functioning correctly.
    else
        player:startEvent(163); -- Hexagonal Cones
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 164) then
        player:messageSpecial(ID.text.NO_RESPONSE_OFFSET+4,478); -- You fit..
        player:messageSpecial(ID.text.NO_RESPONSE_OFFSET+5);     -- Device has been repaired
        player:setVar("MeaChipRegistration",1);
    end
end;
