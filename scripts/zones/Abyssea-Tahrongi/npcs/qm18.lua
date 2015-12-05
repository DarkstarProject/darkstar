-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: ???
-- Spawns: Lacovie
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(16961931) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(OVERGROWN_MANDRAGORA_FLOWER) and player:hasKeyItem(CHIPPED_SANDWORM_TOOTH)) then
            player:startEvent(1020, OVERGROWN_MANDRAGORA_FLOWER, CHIPPED_SANDWORM_TOOTH); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, OVERGROWN_MANDRAGORA_FLOWER, CHIPPED_SANDWORM_TOOTH); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(16961931):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(OVERGROWN_MANDRAGORA_FLOWER);
        player:delKeyItem(CHIPPED_SANDWORM_TOOTH);
    end
end;