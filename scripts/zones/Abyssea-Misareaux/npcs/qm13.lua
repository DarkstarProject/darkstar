-----------------------------------
-- Zone: Abyssea-Misereaux
--  NPC: ???
-- Spawns: Cirein-Croin
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17662481) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(GLISTENING_OROBON_LIVER) and player:hasKeyItem(DOFFED_POROGGO_HAT)) then
            player:startEvent(1021, GLISTENING_OROBON_LIVER, DOFFED_POROGGO_HAT); -- Ask if player wants to use KIs
        else
            player:startEvent(1020, GLISTENING_OROBON_LIVER, DOFFED_POROGGO_HAT); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17662481):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(GLISTENING_OROBON_LIVER);
        player:delKeyItem(DOFFED_POROGGO_HAT);
    end
end;