-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: ??? (Spawn Dea(ZNM T3))
-- !pos -34 -32 481 52
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/TextIDs");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16990474;
    if (trade:hasItemQty(2576,1) and trade:getItemCount() == 1) then -- Trade Olzhiryan Cactus
        if (GetMobAction(mobID) == ACTION_NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;