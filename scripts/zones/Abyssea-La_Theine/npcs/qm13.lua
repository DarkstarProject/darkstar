-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: ???
-- Spawns Briareus
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17318456) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(DENTED_GIGAS_SHIELD) and player:hasKeyItem(WARPED_GIGAS_ARMBAND)
        and player:hasKeyItem(SEVERED_GIGAS_COLLAR)) then -- I broke it into 3 lines at the 'and' because it was so long.
            player:startEvent(1020, DENTED_GIGAS_SHIELD, WARPED_GIGAS_ARMBAND, SEVERED_GIGAS_COLLAR); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, DENTED_GIGAS_SHIELD, WARPED_GIGAS_ARMBAND, SEVERED_GIGAS_COLLAR); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17318456):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(DENTED_GIGAS_SHIELD);
        player:delKeyItem(WARPED_GIGAS_ARMBAND);
        player:delKeyItem(SEVERED_GIGAS_COLLAR);
    end
end;