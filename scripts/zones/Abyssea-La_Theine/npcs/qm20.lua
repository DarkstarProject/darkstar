-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: qm20 (???)
-- Spawns Carabosse
-- !pos ? ? ? 132
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/status");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17318460) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(PELLUCID_FLY_EYE) and player:hasKeyItem(SHIMMERING_PIXIE_PINION)) then
            player:startEvent(1020, PELLUCID_FLY_EYE, SHIMMERING_PIXIE_PINION); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, PELLUCID_FLY_EYE, SHIMMERING_PIXIE_PINION); -- Do not ask, because player is missing at least 1.
        end
    end
]]
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 1020 and option == 1) then
        SpawnMob(17318460):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(PELLUCID_FLY_EYE);
        player:delKeyItem(SHIMMERING_PIXIE_PINION);
    end
end;
