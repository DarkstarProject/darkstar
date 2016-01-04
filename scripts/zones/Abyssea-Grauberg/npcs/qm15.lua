-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: ???
-- Spawns: Raja
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17818051) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(SHATTERED_IRON_GIANT_CHAIN) and player:hasKeyItem(WARPED_CHARIOT_PLATE)) then
            player:startEvent(1020, SHATTERED_IRON_GIANT_CHAIN, WARPED_CHARIOT_PLATE); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, SHATTERED_IRON_GIANT_CHAIN, WARPED_CHARIOT_PLATE); -- Do not ask, because player is missing at least 1.
        end
    end
]]
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 1020 and option == 1) then
        SpawnMob(17818051):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(SHATTERED_IRON_GIANT_CHAIN);
        player:delKeyItem(WARPED_CHARIOT_PLATE);
    end
end;