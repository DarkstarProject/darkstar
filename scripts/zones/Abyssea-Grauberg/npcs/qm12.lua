-----------------------------------
-- Zone: Abyssea-Grauberg
--  NPC: qm12 (???)
-- Spawns Alfard
-- !pos ? ? ? 254
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/status");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17818060) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(VENOMOUS_HYDRA_FANG)) then
            player:startEvent(1020, VENOMOUS_HYDRA_FANG); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, VENOMOUS_HYDRA_FANG); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17818060):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(VENOMOUS_HYDRA_FANG);
    end
end;
