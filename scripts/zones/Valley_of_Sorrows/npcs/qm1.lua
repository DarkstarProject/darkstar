-----------------------------------
-- Area: Valley of Sorrows
--  NPC: qm1 (???)
-- Spawns Adamantoise or Aspidochelone
-- @pos 0 0 -37 59
-----------------------------------
package.loaded["scripts/zones/Valley_of_Sorrows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Valley_of_Sorrows/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local Adamantoise = GetMobAction(17301537);
    local Aspidochelone = GetMobAction(17301538);

    if ((Aspidochelone == ACTION_NONE or Aspidochelone == ACTION_SPAWN)
    and (Adamantoise == ACTION_NONE or Adamantoise == ACTION_SPAWN)) then
        -- Trade Clump of Blue Pondweed
        if (trade:hasItemQty(3343,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_NQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17301537):updateClaim(player);
            end
        -- Trade Clump of Red Pondweed
        elseif (trade:hasItemQty(3344,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_HQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17301538):updateClaim(player);
            end
        end
    end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;