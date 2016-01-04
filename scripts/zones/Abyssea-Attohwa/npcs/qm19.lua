-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: ???
-- Spawns: Ulhuadshi
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17658276) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(MUCID_WORM_SEGMENT) and player:hasKeyItem(SHRIVELED_HECTEYES_STALK)) then
            player:startEvent(1022, MUCID_WORM_SEGMENT, SHRIVELED_HECTEYES_STALK); -- Ask if player wants to use KIs
        else
            player:startEvent(1023, MUCID_WORM_SEGMENT, SHRIVELED_HECTEYES_STALK); -- Do not ask, because player is missing at least 1.
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
    if (csid == 1022 and option == 1) then
        SpawnMob(17658276):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(MUCID_WORM_SEGMENT);
        player:delKeyItem(SHRIVELED_HECTEYES_STALK);
    end
end;