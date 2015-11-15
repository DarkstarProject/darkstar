-----------------------------------
-- Zone: Abyssea-LaTheine
--  NPC: ???
-- Spawns: Hadhayosh
-----------------------------------
require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17318448) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(MARBLED_MUTTON_CHOP) and player:hasKeyItem(BLOODIED_SABER_TOOTH)
        and player:hasKeyItem(BLOOD_SMEARED_GIGAS_HELM) and player:hasKeyItem(GLITTERING_PIXIE_CHOKER)) then
            player:startEvent(1020, MARBLED_MUTTON_CHOP, BLOODIED_SABER_TOOTH, GLITTERING_PIXIE_CHOKER, BLOOD_SMEARED_GIGAS_HELM); -- Ask if player wants to use KIs
        else
            player:startEvent(1021, MARBLED_MUTTON_CHOP, BLOODIED_SABER_TOOTH, GLITTERING_PIXIE_CHOKER, BLOOD_SMEARED_GIGAS_HELM); -- Do not ask, because player is missing at least 1.
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
        SpawnMob(17318448):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(MARBLED_MUTTON_CHOP);
        player:delKeyItem(BLOODIED_SABER_TOOTH);
        player:delKeyItem(GLITTERING_PIXIE_CHOKER);
        player:delKeyItem(BLOOD_SMEARED_GIGAS_HELM);
    end
end;