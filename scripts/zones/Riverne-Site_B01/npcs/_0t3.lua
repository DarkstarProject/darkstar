-----------------------------------
-- Area: Riverne Site #B01
--  NPC: Unstable Displacement
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_B01/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Riverne-Site_B01/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(1691,1) and trade:getItemCount() == 1) then -- Trade Giant Scale
        player:tradeComplete();
        npc:openDoor(RIVERNE_PORTERS);
        player:messageSpecial(SD_HAS_GROWN);
    end

end;

function onTrigger(player,npc)

    if (npc:getAnimation() == 8) then
        player:startEvent(38);
    else
        player:messageSpecial(SD_VERY_SMALL);
    end;

    return 1;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;