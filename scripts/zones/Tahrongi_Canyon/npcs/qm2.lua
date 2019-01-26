-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: qm2 (???)
-- Note: Used to spawn Yara Ma Yha Who
-- !pos 271 0.001 -334 117
-----------------------------------
local ID = require("scripts/zones/Tahrongi_Canyon/IDs")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player, npc, trade)
    -- Trade Distilled water to Spawn Yara Ma Yha Who
    if npcUtil.tradeHas(trade, 4509) and not GetMobByID(ID.mob.YARA_MA_YHA_WHO):isSpawned() then
        if os.time() > npc:getLocalVar("tradeCooldown") then
            local trades = npc:getLocalVar("trades")

            if trades >= 3 and math.random(100) <= 50 then
                player:messageSpecial(ID.text.REPULSIVE_CREATURE_EMERGES)
                SpawnMob(ID.mob.YARA_MA_YHA_WHO):updateClaim(player)
                npc:setLocalVar("trades", 0)
            else
                player:messageSpecial(ID.text.SPROUT_LOOKING_BETTER)
                npc:setLocalVar("trades", trades + 1)
            end

            player:confirmTrade()
            npc:setLocalVar("tradeCooldown", os.time() + 3000) -- 50 minute until next trade
        else
            player:messageSpecial(ID.text.SPROUT_DOES_NOT_NEED_WATER)
        end
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onTrigger(player, npc)
    if os.time() > npc:getLocalVar("tradeCooldown") then
        player:messageSpecial(ID.text.SPROUT_LOOKS_WITHERED)
    else
        player:messageSpecial(ID.text.SPROUT_LOOKING_BETTER)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
