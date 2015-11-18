-----------------------------------
-- Zone: Abyssea-Vunkeral
--  NPC: ???
-- Spawns: Durinn
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17666501) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(DECAYED_DVERGR_TOOTH) and player:hasKeyItem(PULSATING_SOULFLAYER_BEARD)
        and player:hasKeyItem(CHIPPED_IMPS_OLIFANT)) then -- I broke it into 3 lines at the 'and' because it was so long.
            player:startEvent(1015, DECAYED_DVERGR_TOOTH, PULSATING_SOULFLAYER_BEARD, CHIPPED_IMPS_OLIFANT); -- Ask if player wants to use KIs
        else
            player:startEvent(1120, DECAYED_DVERGR_TOOTH, PULSATING_SOULFLAYER_BEARD, CHIPPED_IMPS_OLIFANT); -- Do not ask, because player is missing at least 1.
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
    if (csid == 1015 and option == 1) then
        SpawnMob(17666501):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(DECAYED_DVERGR_TOOTH);
        player:delKeyItem(PULSATING_SOULFLAYER_BEARD);
        player:delKeyItem(CHIPPED_IMPS_OLIFANT);
    end
end;