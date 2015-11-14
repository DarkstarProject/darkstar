-----------------------------------
-- Zone: Abyssea-Vunkeral
--  NPC: ???
-- Spawns: Bukhis
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
--[[
    if (GetMobAction(17666499) == ACTION_NONE) then -- NM not already spawned from this
        if (player:hasKeyItem(INGROWN_TAURUS_NAIL) and player:hasKeyItem(OSSIFIED_GARGOUILLE_HAND)
        and player:hasKeyItem(IMBRUED_VAMPYR_FANG)) then -- I broke it into 3 lines at the 'and' because it was so long.
            player:startEvent(1015, INGROWN_TAURUS_NAIL, OSSIFIED_GARGOUILLE_HAND, IMBRUED_VAMPYR_FANG); -- Ask if player wants to use KIs
        else
            player:startEvent(1120, INGROWN_TAURUS_NAIL, OSSIFIED_GARGOUILLE_HAND, IMBRUED_VAMPYR_FANG); -- Do not ask, because player is missing at least 1.
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
    if (csid == 1015 and option == 1) then
        SpawnMob(17666499):updateClaim(player); -- Spawn NM, Despawn after inactive for 5 minutes (pt has to reclaim within 5 of a wipe)
        player:delKeyItem(INGROWN_TAURUS_NAIL);
        player:delKeyItem(OSSIFIED_GARGOUILLE_HAND);
        player:delKeyItem(IMBRUED_VAMPYR_FANG);
    end
end;