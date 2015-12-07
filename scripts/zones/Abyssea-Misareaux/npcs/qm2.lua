-----------------------------------
-- Zone: Abyssea-Misereaux
--  NPC: ???
-- Spawns: Sobek
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17662478) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(BLOODSTAINED_BUGARD_FANG) and player:hasKeyItem(GNARLED_LIZARD_NAIL)
        and player:hasKeyItem(MOLTED_PEISTE_SKIN)) then -- I broke it into 3 lines at the 'and' because it was so long.
            player:startEvent(1021, BLOODSTAINED_BUGARD_FANG, GNARLED_LIZARD_NAIL, MOLTED_PEISTE_SKIN); -- Ask if player wants to use KIs
        else
            player:startEvent(1020, BLOODSTAINED_BUGARD_FANG, GNARLED_LIZARD_NAIL, MOLTED_PEISTE_SKIN); -- Do not ask, because player is missing at least 1.
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
    if (csid == 1021 and option == 1) then
        SpawnMob(17662478):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(BLOODSTAINED_BUGARD_FANG);
        player:delKeyItem(GNARLED_LIZARD_NAIL);
        player:delKeyItem(MOLTED_PEISTE_SKIN);
    end
end;