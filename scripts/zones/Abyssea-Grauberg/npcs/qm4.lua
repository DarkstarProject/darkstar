-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm4 (???)
-- Spawns Bomblix Flamefinger
-- !pos ? ? ? 254
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3274,1) and trade:hasItemQty(3264,1) and trade:getItemCount() == 2) then -- Player has all the required items.
        if (GetMobAction(17818044) == ACTION_NONE) then -- Mob not already spawned from this
            SpawnMob(17818044):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(1010, 3274 ,3264); -- Inform player what items they need.
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
