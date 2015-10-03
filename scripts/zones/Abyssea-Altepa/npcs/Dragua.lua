-----------------------------------
-- Zone: Abyssea Altepa
--  NPC: ??? (qm)
-- Spawns Dragua (G-9) 
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetMobAction(17670553) == ACTION_NONE) then
        -- NM not already spawned from this, so checking KI
        if (player:hasKeyItem(BLOODIED_DRAGON_EAR)) then
            -- Ask if player wants to use KIs
            player:startEvent(1020, BLOODIED_DRAGON_EAR);
        else
            -- Do not ask, because player is missing at least 1.
            player:startEvent(1021, BLOODIED_DRAGON_EAR);
        end
    end
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
        -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        SpawnMob(17670553, 300):updateEnmity(player);
        player:delKeyItem(BLOODIED_DRAGON_EAR);
    end
end;