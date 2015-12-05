-----------------------------------
-- Zone: Abyssea-Konschtat
--  NPC: qm14 (???)
-- Spawns: Eccentric Eve
-- @pos ? ? ? 15
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(16839007) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(FRAGRANT_TREANT_PETAL)
        and player:hasKeyItem(FETID_RAFFLESIA_STALK)
        and player:hasKeyItem(DECAYING_MORBOL_TOOTH)
        and player:hasKeyItem(TURBID_SLIME_OIL)
        and player:hasKeyItem(VENOMOUS_PEISTE_CLAW)) then
            player:startEvent(1020, FRAGRANT_TREANT_PETAL, FETID_RAFFLESIA_STALK, DECAYING_MORBOL_TOOTH, TURBID_SLIME_OIL, VENOMOUS_PEISTE_CLAW); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, FRAGRANT_TREANT_PETAL, FETID_RAFFLESIA_STALK, DECAYING_MORBOL_TOOTH, TURBID_SLIME_OIL, VENOMOUS_PEISTE_CLAW); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(16839007):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(FRAGRANT_TREANT_PETAL);
        player:delKeyItem(FETID_RAFFLESIA_STALK);
        player:delKeyItem(DECAYING_MORBOL_TOOTH);
        player:delKeyItem(TURBID_SLIME_OIL);
        player:delKeyItem(VENOMOUS_PEISTE_CLAW);
    end
end;