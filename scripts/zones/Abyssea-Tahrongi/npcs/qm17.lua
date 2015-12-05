-----------------------------------
-- Zone: Abyssea-Tahrongi
--  NPC: ???
-- Spawns: Glavoid
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(16961930) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(FAT_LINED_COCKATRICE_SKIN) and player:hasKeyItem(SODDEN_SANDWORM_HUSK)
        and player:hasKeyItem(LUXURIANT_MANTICORE_MANE) -- I broke it into 3 lines at the 'and' because it was so long.
        and player:hasKeyItem(STICKY_GNAT_WING)) then
            player:startEvent(1020, FAT_LINED_COCKATRICE_SKIN, SODDEN_SANDWORM_HUSK, LUXURIANT_MANTICORE_MANE, STICKY_GNAT_WING); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, FAT_LINED_COCKATRICE_SKIN, SODDEN_SANDWORM_HUSK, LUXURIANT_MANTICORE_MANE, STICKY_GNAT_WING); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(16961930):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(FAT_LINED_COCKATRICE_SKIN);
        player:delKeyItem(SODDEN_SANDWORM_HUSK);
        player:delKeyItem(LUXURIANT_MANTICORE_MANE);
        player:delKeyItem(STICKY_GNAT_WING);
    end
end;