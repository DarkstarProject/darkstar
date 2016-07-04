-----------------------------------
-- Zone: Abyssea-Misereaux
--  NPC: ???
-- Spawns: Amhuluk
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17662477) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(JAGGED_APKALLU_BEAK) and player:hasKeyItem(CLIPPED_BIRD_WING)
        and player:hasKeyItem(BLOODIED_BAT_FUR)) then -- I broke it into 3 lines at the 'and' because it was so long.
            player:startEvent(1021, JAGGED_APKALLU_BEAK, CLIPPED_BIRD_WING, BLOODIED_BAT_FUR); -- Ask if player wants to use KIs
        else
            player:startEvent(1020, JAGGED_APKALLU_BEAK, CLIPPED_BIRD_WING, BLOODIED_BAT_FUR); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17662477):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(JAGGED_APKALLU_BEAK);
        player:delKeyItem(CLIPPED_BIRD_WING);
        player:delKeyItem(BLOODIED_BAT_FUR);
    end
end;