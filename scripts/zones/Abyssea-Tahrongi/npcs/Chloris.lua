-----------------------------------
-- Zone: Abyssea Tahrongi
--  NPC: ??? (qm)
-- Spawns  Chloris  (I-8)
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/keyitems");
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (GetMobAction(16961929) == ACTION_NONE) then
        -- NM not already spawned from this, so checking KI
        if(player:hasKeyItem(VEINOUS_HECTEYES_EYELID)and player:hasKeyItem(TORN_BAT_WING)and player:hasKeyItem(GORY_SCORPION_CLAW)  and player:hasKeyItem(MOSSY_ADAMANTOISE_SHELL)) then
		-- Ask if player wants to use KIs
            player:startEvent(1020, VEINOUS_HECTEYES_EYELID, TORN_BAT_WING, GORY_SCORPION_CLAW), (MOSSY_ADAMANTOISE_SHELL);
        else
        -- Do not ask, because player is missing at least 1.
            player:startEvent(1021, VEINOUS_HECTEYES_EYELID, TORN_BAT_WING, GORY_SCORPION_CLAW), (MOSSY_ADAMANTOISE_SHELL);
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
        SpawnMob(16961929, 300):updateEnmity(player);
        player:delKeyItem(VEINOUS_HECTEYES_EYELID);
        player:delKeyItem(TORN_BAT_WING);
        player:delKeyItem(GORY_SCORPION_CLAW);
		player:delKeyItem(MOSSY_ADAMANTOISE_SHELL);
    end
end;