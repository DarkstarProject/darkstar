-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Abquhbah
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local PROMOTION = player:getVar("AssaultPromotion");
    if PROMOTION <= 7 then
        RANK = 1
    elseif PROMOTION >= 8 and PROMOTION <= 11 then
        RANK = 2
    elseif PROMOTION >= 12 and PROMOTION <= 18 then
        RANK = 3
    elseif PROMOTION >= 19 then
        RANK = 4
    end
     
    player:startEvent(255,RANK);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;