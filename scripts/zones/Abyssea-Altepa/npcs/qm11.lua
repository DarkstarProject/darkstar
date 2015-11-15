-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: ???
-- Spawns: Rani
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17670551) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(BROKEN_IRON_GIANT_SPIKE) and player:hasKeyItem(RUSTED_CHARIOT_GEAR)) then
            player:startEvent(1020, BROKEN_IRON_GIANT_SPIKE, RUSTED_CHARIOT_GEAR); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, BROKEN_IRON_GIANT_SPIKE, RUSTED_CHARIOT_GEAR); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17670551):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(BROKEN_IRON_GIANT_SPIKE);
        player:delKeyItem(RUSTED_CHARIOT_GEAR);
    end
end;