-----------------------------------
-- Area: Arrapago Reef
--  NPC: ??? (Spawn Zareehkl the Jubilant(ZNM T2))
-- @pos 176 -4 182 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Arrapago_Reef/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16998873;
    if (trade:hasItemQty(2598,1) and trade:getItemCount() == 1) then -- Trade Merow No 11 Molting
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