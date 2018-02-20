-----------------------------------
--  NPC: Stale Draft
-- Area: Sacrarium
-- Notes: Used to spawn Swift Belt NM's
-----------------------------------
package.loaded["scripts/zones/Sacrarium/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Sacrarium/TextIDs");
require("scripts/zones/Sacrarium/MobIDs");
-----------------------------------

function onTrigger(player,npc)
    local hate = player:getVar("FOMOR_HATE");

    if (hate < 8) then --hate lvl 1
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    elseif (hate < 12) then
        player:messageSpecial(START_GET_GOOSEBUMPS);
    elseif (hate < 50) then
        player:messageSpecial(HEART_RACING);
    elseif (hate >= 50) then
        player:messageSpecial(LEAVE_QUICKLY_AS_POSSIBLE);
    end
end;

function onTrade(player,npc,trade)
    -- fomor codex
    if (trade:hasItemQty(1877,1) and trade:getItemCount() == 1) then
        local draftOffset = npc:getID() - STALE_DRAFT_OFFSET;
        local nmId = SWIFT_BELT_NMS[draftOffset + 1][1];
        local races = SWIFT_BELT_NMS[draftOffset + 1][2];
        local nm = GetMobByID(nmId);
        local race = player:getRace();
        local hate = player:getVar("FOMOR_HATE");

        if (races[race] ~= nil and not nm:isSpawned() and hate >= 50) then
            player:tradeComplete();
            player:setVar("FOMOR_HATE",0);
            SpawnMob(nmId):updateClaim(player);
        else
            player:messageSpecial(NOTHING_HAPPENS);
        end
    end
end;

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end;
