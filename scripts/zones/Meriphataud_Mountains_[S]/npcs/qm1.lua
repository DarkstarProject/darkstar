-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: ???
-- !pos 757 -16 -446
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/zones/Meriphataud_Mountains_[S]/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (trade:hasItemQty(2566,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(17174889):updateClaim(player); -- Bloodlapper
    end
end;

function onTrigger(player,npc)

    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;