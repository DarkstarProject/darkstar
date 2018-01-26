-----------------------------------
-- Area: Halvung
--  NPC: ??? (Spawn Reacton(ZNM T2))
-- !pos 18 -9 213 62
-----------------------------------
package.loaded["scripts/zones/Halvung/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Halvung/TextIDs");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17031599;
    if (trade:hasItemQty(2588,1) and trade:getItemCount() == 1) then -- Trade Bone Charcoal
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