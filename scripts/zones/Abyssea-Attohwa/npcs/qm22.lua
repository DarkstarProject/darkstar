-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: ???
-- Spawns: Titlacauan
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17658279) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(BLOTCHED_DOOMED_TONGUE) and player:hasKeyItem(CRACKED_SKELETON_CLAVICLE)
        and player:hasKeyItem(WRITHING_GHOST_FINGER) -- I broke it into 3 lines at the 'and' because it was so long.
        and player:hasKeyItem(RUSTED_HOUND_COLLAR)) then
            player:startEvent(1022, BLOTCHED_DOOMED_TONGUE, CRACKED_SKELETON_CLAVICLE, WRITHING_GHOST_FINGER, RUSTED_HOUND_COLLAR); -- Ask if player wants to use KIs
        else
            player:startEvent(1023, BLOTCHED_DOOMED_TONGUE, CRACKED_SKELETON_CLAVICLE, WRITHING_GHOST_FINGER, RUSTED_HOUND_COLLAR); -- Do not ask, because player is missing at least 1.
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
    if (csid == 1022 and option == 1) then
        SpawnMob(17658279):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(BLOTCHED_DOOMED_TONGUE);
        player:delKeyItem(CRACKED_SKELETON_CLAVICLE);
        player:delKeyItem(WRITHING_GHOST_FINGER);
        player:delKeyItem(RUSTED_HOUND_COLLAR);
    end
end;