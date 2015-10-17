-----------------------------------
-- Area: Mamook
--  NPC: ??? (Spawn Chamrosh(ZNM T1))
-- @pos 206 14 -285 65
-----------------------------------
package.loaded["scripts/zones/Mamook/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Mamook/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17043887;
    if (trade:hasItemQty(2581,1) and trade:getItemCount() == 1) then -- Trade Floral Nectar
        if (GetMobAction(mobID) == ACTION_NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
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