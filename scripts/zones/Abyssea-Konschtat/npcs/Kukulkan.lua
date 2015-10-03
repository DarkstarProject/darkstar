-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: ??? (qm)
-- Spawns Kukulkan (H-5)
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetMobAction(16838872) == ACTION_NONE) then
        -- NM not already spawned from this, so checking KI
        if (player:hasKeyItem(TATTERED_HIPPOGRYPH_WING) and player:hasKeyItem(CRACKED_WIVRE_HORN) and player:hasKeyItem(MUCID_AHRIMAN_EYEBALL)) then
            -- Ask if player wants to use KIs
            player:startEvent(1020, TATTERED_HIPPOGRYPH_WING, CRACKED_WIVRE_HORN, MUCID_AHRIMAN_EYEBALL);
        else
            -- Do not ask, because player is missing at least 1.
            player:startEvent(1021, TATTERED_HIPPOGRYPH_WING, CRACKED_WIVRE_HORN, MUCID_AHRIMAN_EYEBALL);
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
        SpawnMob(16838872, 300):updateEnmity(player);
        player:delKeyItem(TATTERED_HIPPOGRYPH_WING);
        player:delKeyItem(CRACKED_WIVRE_HORN);
        player:delKeyItem(MUCID_AHRIMAN_EYEBALL);
    end
end;