-----------------------------------
-- Area: Castle Zvahl Baileys
--  NPC: Torch (x4)
-- Involved in Quests: Borghertz's Hands (AF Hands, Many job)
-- !pos 63 -24 21 161
-----------------------------------
local ID = require("scripts/zones/Castle_Zvahl_Baileys/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local offset = npc:getID() - ID.npc.TORCH_OFFSET

    -- killed Dark Spark and clicked same torch used to spawn
    if player:getVar("BorghertzSparkKilled") == 1 and GetMobByID(ID.mob.DARK_SPARK):getLocalVar("fromTorch") == offset then
        npcUtil.giveKeyItem(player, dsp.ki.SHADOW_FLAMES)
        player:setVar("BorghertzSparkKilled", 0)
        player:setVar("BorghertzCS", 0)

    -- attempt to spawn Dark Spark from torch
    elseif
        player:getVar("BorghertzSparkKilled") == 0 and
        player:hasKeyItem(dsp.ki.OLD_GAUNTLETS) and
        not player:hasKeyItem(dsp.ki.SHADOW_FLAMES) and
        player:getVar("BorghertzCS") >= 2 and
        npcUtil.popFromQM(player, npc, ID.mob.DARK_SPARK, {claim=true, hide=0})
    then
        player:messageSpecial(ID.text.SENSE_OF_FOREBODING)
        GetMobByID(ID.mob.DARK_SPARK):setLocalVar("fromTorch", offset)
        player:setVar("BorghertzSparkKilled", 0)

    -- default dialog
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
