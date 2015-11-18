-----------------------------------
-- Zone: Abyssea-Vunkeral
--  NPC: ???
-- Spawns: Karkadann
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17666502) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(MALODOROUS_MARID_FUR) and player:hasKeyItem(WARPED_SMILODON_CHOKER)) then
            player:startEvent(1015, MALODOROUS_MARID_FUR, WARPED_SMILODON_CHOKER); -- Ask if player wants to use KIs
        else
            player:startEvent(1120, MALODOROUS_MARID_FUR, WARPED_SMILODON_CHOKER); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17666502):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(MALODOROUS_MARID_FUR);
        player:delKeyItem(WARPED_SMILODON_CHOKER);
    end
end;