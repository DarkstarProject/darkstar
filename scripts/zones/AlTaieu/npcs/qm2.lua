-----------------------------------
-- Area: Al'Taieu
--  NPC: ??? (Jailer of Justice Spawn)
-- Allows players to spawn the Jailer of Justice by trading the Second Virtue, Deed of Moderation, and HQ Xzomit Organ to a ???.
-- !pos , -278 0 -463
-----------------------------------
package.loaded["scripts/zones/AlTaieu/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/AlTaieu/TextIDs");
require("scripts/zones/AlTaieu/MobIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    --[[
    -- JAILER OF JUSTICE
    if (
        not GetMobByID(JAILER_OF_JUSTICE):isSpawned() and
        trade:hasItemQty(1853,1) and -- second_virtue
        trade:hasItemQty(1854,1) and -- deed_of_moderation
        trade:hasItemQty(1855,1) and -- hq_xzomit_organ
        trade:getItemCount() == 3
    ) then
        player:tradeComplete();
        SpawnMob(JAILER_OF_JUSTICE):updateClaim(player);
    end
    --]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);
end;
