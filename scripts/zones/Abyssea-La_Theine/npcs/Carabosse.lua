-----------------------------------
-- Zone: Abyssea-La Theine
--  NPC: ??? (qm)
-- Spawns Carabosse  (H-7)
-----------------------------------

require("scripts/globals/status");

require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------



function onTrigger(player,npc)

    if (GetMobAction(17318457) == ACTION_NONE) then

        -- NM not already spawned from this, so checking KI

        if(player:hasKeyItem(SHIMMERING_PIXIE_PINION) and player:hasKeyItem(PELLUCID_FLY_EYE)) then

		-- Ask if player wants to use KIs

            player:startEvent(1019, SHIMMERING_PIXIE_PINION, PELLUCID_FLY_EYE);

        else

        -- Do not ask, because player is missing at least 1.

            player:startEvent(1020, SHIMMERING_PIXIE_PINION, PELLUCID_FLY_EYE);

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

    if (csid == 1019 and option == 1) then

        -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)

        SpawnMob(17318457, 300):updateEnmity(player);

        player:delKeyItem(PELLUCID_FLY_EYE);

        player:delKeyItem(SHIMMERING_PIXIE_PINION);

    end

end;