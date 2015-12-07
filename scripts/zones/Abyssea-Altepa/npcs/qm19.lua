-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: ???
-- Spawns:
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17670554) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(RESPLENDENT_ROC_QUILL)) then
            player:startEvent(1020, RESPLENDENT_ROC_QUILL); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, RESPLENDENT_ROC_QUILL); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17670554):updateEnmity(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(RESPLENDENT_ROC_QUILL);
    end
end;