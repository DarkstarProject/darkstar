-----------------------------------
-- Zone: Abyssea-Attohwa
--  NPC: ???
-- Spawns: Smok
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17658274) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(HOLLOW_DRAGON_EYE)) then
            player:startEvent(1022, HOLLOW_DRAGON_EYE); -- Ask if player wants to use KIs
        else
            player:startEvent(1023, HOLLOW_DRAGON_EYE); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17658274):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(HOLLOW_DRAGON_EYE);
    end
end;