-----------------------------------
-- Zone: Abyssea-La Theine
--  NPC: ??? (qm)
-- Spawns Hadhayosh  (K-8)
-----------------------------------

require("scripts/globals/status");

require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------



function onTrigger(player,npc)

    if (GetMobAction(17318461) == ACTION_NONE) then

        -- NM not already spawned from this, so checking KI

        if(player:hasKeyItem(MARBLED_MUTTON_CHOP) and player:hasKeyItem(GLITTERING_PIXIE_CHOKER)and player:hasKeyItem(BLOOD_SMEARED_GIGAS_HELM) and player:hasKeyItem(BLOODIED_SABER_TOOTH) ) then

		-- Ask if player wants to use KIs

            player:startEvent(1020, MARBLED_MUTTON_CHOP, GLITTERING_PIXIE_CHOKER, BLOOD_SMEARED_GIGAS_HELM, BLOODIED_SABER_TOOTH);

        else

        -- Do not ask, because player is missing at least 1.

            player:startEvent(1021, MARBLED_MUTTON_CHOP, GLITTERING_PIXIE_CHOKER, BLOOD_SMEARED_GIGAS_HELM, BLOODIED_SABER_TOOTH);

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

        SpawnMob(17318461, 300):updateEnmity(player);

        player:delKeyItem(MARBLED_MUTTON_CHOP);
        player:delKeyItem(GLITTERING_PIXIE_CHOKER);
		player:delKeyItem(BLOOD_SMEARED_GIGAS_HELM);
		player:delKeyItem(BLOODIED_SABER_TOOTH);

    end

end;