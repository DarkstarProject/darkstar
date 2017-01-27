-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm7 (???)
-- Spawns La Theine Liege
-- @pos 81.958 16.110 193.761 132
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(2897,1) and trade:getItemCount() == 1) then -- Player has all the required items.
        if (GetMobAction(17318440) == ACTION_NONE) then -- mob not already spawned from this
            SpawnMob(17318440):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(1010, 2897); -- Inform payer what items they need.
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
