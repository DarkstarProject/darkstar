-----------------------------------
-- Zone: Abyssea-Altepa
--  NPC: ???
-- Spawns: Dragua
-----------------------------------


require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17670553) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(BLOODIED_DRAGON_EAR)) then
            player:startEvent(1020, BLOODIED_DRAGON_EAR); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, BLOODIED_DRAGON_EAR); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17670553):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(BLOODIED_DRAGON_EAR);
    end
end;