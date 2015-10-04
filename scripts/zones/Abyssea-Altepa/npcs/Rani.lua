-----------------------------------
-- Zone: Abyssea Altepa
--  NPC: ??? (qm)
-- Spawns Rani (D-10)
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetMobAction(17670555) == ACTION_NONE) then
        -- NM not already spawned from this, so checking KI
        if (player:hasKeyItem(RUSTED_CHARIOT_GEAR) and player:hasKeyItem(BROKEN IRON GIANT SPIKE)) then
            -- Ask if player wants to use KIs
            player:startEvent(1020, RUSTED_CHARIOT_GEAR, BROKEN_IRON_GIANT_SPIKE);
        else
            -- Do not ask, because player is missing at least 1.
            player:startEvent(1021, RUSTED_CHARIOT_GEAR, BROKEN_IRON_GIANT_SPIKE);
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
        SpawnMob(17670555, 300):updateEnmity(player);
        player:delKeyItem(RUSTED_CHARIOT_GEAR);
        player:delKeyItem(BROKEN_IRON_GIANT_SPIKE);
    end
end;