-----------------------------------
-- Area: Castle Zvahl Baileys
--  NPC: Torch (x4)
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- !pos 63 -24 21 161
-----------------------------------
package.loaded["scripts/zones/Castle_Zvahl_Baileys/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Castle_Zvahl_Baileys/TextIDs")
require("scripts/zones/Castle_Zvahl_Baileys/MobIDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local offset = npc:getID() - ZVAHL_BAILEYS_TORCH_OFFSET
    
    -- killed Dark Spark and clicked same torch used to spawn
    if player:getVar("BorghertzSparkKilled") == 1 and GetMobByID(DARK_SPARK):getLocalVar("fromTorch") == offset then
        npcUtil.giveKeyItem(player, dsp.ki.SHADOW_FLAMES)
        player:setVar("BorghertzSparkKilled", 0)
        player:setVar("BorghertzCS", 0)

    -- attempt to spawn Dark Spark from torch
    elseif
        player:getVar("BorghertzSparkKilled") == 0 and
        player:hasKeyItem(dsp.ki.OLD_GAUNTLETS) and
        not player:hasKeyItem(dsp.ki.SHADOW_FLAMES) and
        player:getVar("BorghertzCS") >= 2 and
        npcUtil.popFromQM(player, npc, DARK_SPARK, true, false)
    then
        player:messageSpecial(SENSE_OF_FOREBODING)
        GetMobByID(DARK_SPARK):setLocalVar("fromTorch", offset)
        player:setVar("BorghertzSparkKilled", 0)

    -- default dialog
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end

