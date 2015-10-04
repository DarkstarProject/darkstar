-----------------------------------
-- Zone: Abyssea Tahrongi
--  NPC: ??? (qm)
-- Spawns Lacovie (F-5)
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetMobAction(16961948) == ACTION_NONE) then
        -- NM not already spawned from this, so checking KI
        if (player:hasKeyItem(OVERGROWN_MANDRAGORA_FLOWER) and player:hasKeyItem(CHIPPED_SANDWORM_TOOTH)) then
            -- Ask if player wants to use KIs
            player:startEvent(1020, OVERGROWN_MANDRAGORA_FLOWER, CHIPPED_SANDWORM_TOOTH);
        else
            -- Do not ask, because player is missing at least 1.
            player:startEvent(1021, OVERGROWN_MANDRAGORA_FLOWER, CHIPPED_SANDWORM_TOOTH);
        end
    end
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
        -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        SpawnMob(16961948, 300):updateEnmity(player);
        player:delKeyItem(OVERGROWN_MANDRAGORA_FLOWER);
        player:delKeyItem(CHIPPED_SANDWORM_TOOTH);
        
    end
end;