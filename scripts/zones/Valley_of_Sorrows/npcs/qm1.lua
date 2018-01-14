-----------------------------------
-- Area: Valley of Sorrows
--  NPC: qm1 (???)
-- Spawns Adamantoise or Aspidochelone
-- !pos 0 0 -37 59
-----------------------------------
package.loaded["scripts/zones/Valley_of_Sorrows/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Valley_of_Sorrows/TextIDs");
require("scripts/zones/Valley_of_Sorrows/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

function onSpawn(npc)
    if (LandKingSystem_NQ < 1 and LandKingSystem_HQ < 1) then
        npc:setStatus(STATUS_DISAPPEAR);
    end
end;

function onTrade(player,npc,trade)
    local nq = GetMobByID(ADAMANTOISE);
    local hq = GetMobByID(ASPIDOCHELONE);

    if (not nq:isSpawned() and not hq:isSpawned()) then
        -- Trade Clump of Blue Pondweed
        if (trade:hasItemQty(3343,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_NQ ~= 0) then
                player:tradeComplete();
                SpawnMob(ADAMANTOISE):updateClaim(player);
                npc:setStatus(STATUS_DISAPPEAR);
            end
        -- Trade Clump of Red Pondweed
        elseif (trade:hasItemQty(3344,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_HQ ~= 0) then
                player:tradeComplete();
                SpawnMob(ASPIDOCHELONE):updateClaim(player);
                npc:setStatus(STATUS_DISAPPEAR);
            end
        end
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
