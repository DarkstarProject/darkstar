-----------------------------------
-- Zone: Abyssea Tahrongi
--  NPC: ??? (qm)
-- Spawns Glavoid (I-5)
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetMobAction(16961930) == ACTION_NONE) then
        -- NM not already spawned from this, so checking KI
        if (player:hasKeyItem(FAT_LINED_COCKATRICE_SKIN) and player:hasKeyItem(SODDEN_SANDWORM_HUSK) and player:hasKeyItem(LUXURIANT_MANTICORE_MANE) and player:hasKeyItem(STICKY_GNAT_WING)) then
            -- Ask if player wants to use KIs
            player:startEvent(1020, FAT_LINED_COCKATRICE_SKIN, SODDEN_SANDWORM_HUSK, LUXURIANT_MANTICORE_MANE, STICKY_GNAT_WING);
        else
            -- Do not ask, because player is missing at least 1.
            player:startEvent(1021, FAT_LINED_COCKATRICE_SKIN, SODDEN_SANDWORM_HUSK, LUXURIANT_MANTICORE_MANE, STICKY_GNAT_WING);
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
        SpawnMob(16961930, 300):updateEnmity(player);
        player:delKeyItem(FAT_LINED_COCKATRICE_SKINL);
        player:delKeyItem(SODDEN_SANDWORM_HUSK);
        player:delKeyItem(LUXURIANT_MANTICORE_MANE);
        player:delKeyItem(STICKY_GNAT_WING);
    end
end;