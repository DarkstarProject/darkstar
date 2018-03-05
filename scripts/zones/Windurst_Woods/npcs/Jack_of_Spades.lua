-----------------------------------
-- Area: Windurst Woods
--  NPC: Jack of Spades
-- Adventurer's Assistant
-- Working 100%
-------------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");

function onTrade(player,npc,trade)

count = trade:getItemCount();
AdventurerCoupon = trade:hasItemQty(536,1);

    if (AdventurerCoupon == true and count == 1) then
        player:startEvent(10010,GIL_RATE*50);
    end
end;

function onTrigger(player,npc)
    player:startEvent(10009,0,4);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 10010) then
        player:tradeComplete();
        player:addGil(GIL_RATE*50);
    end
end;



