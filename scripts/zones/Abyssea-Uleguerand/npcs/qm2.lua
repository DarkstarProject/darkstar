-----------------------------------
-- Zone: Abyssea-Uleguerand
--  NPC: qm2 (???)
-- Spawns Dhorme Khimaira
-- !pos ? ? ? 253
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
--[[
    if (trade:hasItemQty(3253,1) and trade:hasItemQty(3247,1) and trade:hasItemQty(3246,1) and trade:getItemCount() == 3) then -- Player has all the required items.
        if (GetMobAction(17813927) == ACTION_NONE) then -- Mob not already spawned from this
            SpawnMob(17813927):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
            player:tradeComplete();
        end
    end
]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(1010, 3253 ,3247 ,3246); -- Inform player what items they need.
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
