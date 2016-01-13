-----------------------------------
-- Area: Riverne Site #A01
--  NPC: Unstable Displacement
-----------------------------------

require("scripts/globals/settings");
local text = require("scripts/zones/Riverne-Site_A01/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(1691,1) and trade:getItemCount() == 1) then -- Trade Giant Scale
        player:tradeComplete();
        npc:openDoor(RIVERNE_PORTERS);
        player:messageSpecial(text.SD_HAS_GROWN);
    end    
    
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

    if (npc:getAnimation() == 8) then
        player:startEvent(0x20);
    else
        player:messageSpecial(text.SD_VERY_SMALL);
    end;
    
    return 1;
    
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