-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: qm11 (???)
-- Spawns Muscaliet
-- !pos ? ? ? 45
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(2950,1) and trade:hasItemQty(2925,1) and trade:getItemCount() == 2) then -- Player has all the required items.
        if (GetMobAction(16961927) == ACTION_NONE) then -- Mob not already spawned from this
            SpawnMob(16961927):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(1010, 2950, 2925); -- Inform payer what items they need.
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
