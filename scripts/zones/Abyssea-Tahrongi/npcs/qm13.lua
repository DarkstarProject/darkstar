-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: ???
-- Spawns: Chloris
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(16961946) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(VEINOUS_HECTEYES_EYELID) and player:hasKeyItem(TORN_BAT_WING)
        and player:hasKeyItem(GORY_SCORPION_CLAW) -- I broke it into 3 lines at the 'and' because it was so long.
        and player:hasKeyItem(MOSSY_ADAMANTOISE_SHELL)) then
            player:startEvent(1020, VEINOUS_HECTEYES_EYELID, TORN_BAT_WING, GORY_SCORPION_CLAW, MOSSY_ADAMANTOISE_SHELL); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, VEINOUS_HECTEYES_EYELID, TORN_BAT_WING, GORY_SCORPION_CLAW, MOSSY_ADAMANTOISE_SHELL); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(16961946):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(VEINOUS_HECTEYES_EYELID);
        player:delKeyItem(TORN_BAT_WING);
        player:delKeyItem(GORY_SCORPION_CLAW);
        player:delKeyItem(MOSSY_ADAMANTOISE_SHELL);
    end
end;