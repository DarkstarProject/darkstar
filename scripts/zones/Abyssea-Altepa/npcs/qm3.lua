-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: qm3 (???)
-- Spawns Shaula
-- !pos ? ? ? 218
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3233,1) and trade:hasItemQty(3242,1) and trade:getItemCount() == 2) then -- Player has all the required items.
        if (GetMobAction(17670570) == ACTION_NONE) then -- Mob not already spawned from this
            SpawnMob(17670570):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(1010, 3233 ,3242); -- Inform player what items they need.
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
