-----------------------------------
-- Area: Halvung
--  NPC: ??? (Spawn Achamoth(ZNM T3))
-- @pos -34 10 336 62
-----------------------------------
package.loaded["scripts/zones/Halvung/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Halvung/TextIDs");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 17031600;
    if (trade:hasItemQty(2586,1) and trade:getItemCount() == 1) then -- Trade Rock Juice
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