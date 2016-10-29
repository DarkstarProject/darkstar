-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm1 (???)
-- Spawns Ironclad Sunderer
-- @pos ? ? ? 254
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3260,1) and trade:hasItemQty(3266,1) and trade:getItemCount() == 2) then -- Player has all the required items.
        if (GetMobAction(17818041) == ACTION_NONE) then -- Mob not already spawned from this
            SpawnMob(17818041):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(1010, 3260, 3266); -- Inform player what items they need.
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
