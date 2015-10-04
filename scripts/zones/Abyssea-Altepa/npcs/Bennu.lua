-----------------------------------
-- Zone: Abyssea Altepa
--  NPC: ??? (qm)
-- Spawns Bennu (I-8)
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetMobAction(17670554) == ACTION_NONE) then
        -- NM not already spawned from this, so checking KI
        if (player:hasKeyItem(RESPLENDENT_ROC_QUILL)) then
            -- Ask if player wants to use KIs
            player:startEvent(1020, RESPLENDENT_ROC_QUILL);
        else
            -- Do not ask, because player is missing at least 1.
            player:startEvent(1021, RESPLENDENT_ROC_QUILL);
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
        SpawnMob(17670554, 300):updateEnmity(player);
        player:delKeyItem(RESPLENDENT_ROC_QUILL);
    end
end;