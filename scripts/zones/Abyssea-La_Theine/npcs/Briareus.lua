-----------------------------------
-- Zone: Abyssea-La Theine
--  NPC: ??? (qm)
-- Spawns Briareus  (G-6) 
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/keyitems");
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetMobAction(17318456) == ACTION_NONE) then
        -- NM not already spawned from this, so checking KI
        if(player:hasKeyItem(DENTED_GIGAS_SHIELD)
        and player:hasKeyItem(WARPED_GIGAS_ARMBAND)
        and player:hasKeyItem(SEVERED_GIGAS_COLLAR)) then
		-- Ask if player wants to use KIs
            player:startEvent(1020, DENTED_GIGAS_SHIELD, WARPED_GIGAS_ARMBAND, SEVERED_GIGAS_COLLAR);
        else
        -- Do not ask, because player is missing at least 1.
            player:startEvent(1021, DENTED_GIGAS_SHIELD, WARPED_GIGAS_ARMBAND,SEVERED_GIGAS_COLLAR);
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
        SpawnMob(17318456, 300):updateEnmity(player);
        player:delKeyItem(DENTED_GIGAS_SHIELD);
        player:delKeyItem(WARPED_GIGAS_ARMBAND);
        player:delKeyItem(SEVERED_GIGAS_COLLAR);
    end
end;