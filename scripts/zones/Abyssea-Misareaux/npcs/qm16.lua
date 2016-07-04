-----------------------------------
-- Zone: Abyssea-Misereaux
--  NPC: ???
-- Spawns: Ironclad Pulverizor
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17662484) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(BLAZING_CLUSTER_SOUL) and player:hasKeyItem(SCALDING_IRONCLAD_SPIKE)) then
            player:startEvent(1021, BLAZING_CLUSTER_SOUL, SCALDING_IRONCLAD_SPIKE); -- Ask if player wants to use KIs
        else
            player:startEvent(1020, BLAZING_CLUSTER_SOUL, SCALDING_IRONCLAD_SPIKE); -- Do not ask, because player is missing at least 1.
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
    if (csid == 1021 and option == 1) then
        SpawnMob(17662484):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(BLAZING_CLUSTER_SOUL);
        player:delKeyItem(SCALDING_IRONCLAD_SPIKE);
    end
end;