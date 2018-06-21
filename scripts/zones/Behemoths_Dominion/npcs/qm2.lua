-----------------------------------
-- Area: Behemoth's Dominion
--  NPC: qm2 (???)
-- Spawns Behemoth or King Behemoth
-- !pos -267 -19 74 127
-----------------------------------
package.loaded["scripts/zones/Behemoths_Dominion/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Behemoths_Dominion/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onSpawn(npc)
    if (LandKingSystem_NQ < 1 and LandKingSystem_HQ < 1) then
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrade(player,npc,trade)
    local Behemoth = GetMobAction(17297440);
    local KingBehemoth = GetMobAction(17297441);

    if ((KingBehemoth == dsp.act.NONE or KingBehemoth == dsp.act.SPAWN)
    and (Behemoth == dsp.act.NONE or Behemoth == dsp.act.SPAWN)) then
        -- Trade Beastly Shank
        if (trade:hasItemQty(3341,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_NQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17297440):updateClaim(player);
                npc:setStatus(dsp.status.DISAPPEAR);
            end
        -- Trade Savory Shank
        elseif (trade:hasItemQty(3342,1) and trade:getItemCount() == 1) then
            if (LandKingSystem_HQ ~= 0) then
                player:tradeComplete();
                SpawnMob(17297441):updateClaim(player);
                npc:setStatus(dsp.status.DISAPPEAR);
            end
        end
    end

end;

function onTrigger(player,npc)
    player:messageSpecial(IRREPRESSIBLE_MIGHT);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
