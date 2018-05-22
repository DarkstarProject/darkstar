-----------------------------------
-- Area: Dragons Aery
--  NPC: qm0 (???)
-- Spawns Fafnir or Nidhogg
-- !pos -81 32 2 178
-----------------------------------
package.loaded["scripts/zones/Dragons_Aery/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Dragons_Aery/TextIDs")
require("scripts/zones/Dragons_Aery/MobIDs")
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onSpawn(npc)
    if LandKingSystem_NQ < 1 and LandKingSystem_HQ < 1 then
        npc:setStatus(dsp.status.DISAPPEAR)
    end
end

function onTrade(player,npc,trade)
    local nq = GetMobByID(FAFNIR)
    local hq = GetMobByID(NIDHOGG)

    if not nq:isSpawned() and not hq:isSpawned() then
        if trade:hasItemQty(3339,1) and trade:getItemCount() == 1 and LandKingSystem_NQ ~= 0 then -- Cup of Honey Wine
            player:tradeComplete()
            SpawnMob(FAFNIR):updateClaim(player)
            npc:setStatus(dsp.status.DISAPPEAR)
        elseif trade:hasItemQty(3340,1) and trade:getItemCount() == 1 and LandKingSystem_HQ ~= 0 then -- Cup of Sweet Tea
            player:tradeComplete()
            SpawnMob(NIDHOGG):updateClaim(player)
            npc:setStatus(dsp.status.DISAPPEAR)
        end
    end
end

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
