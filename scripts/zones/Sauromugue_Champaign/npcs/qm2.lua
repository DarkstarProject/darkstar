-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: qm2 (???) (Tower 2)
-- Involved in Quest: THF AF "As Thick As Thieves"
-- !pos 196.830 31.300 206.078 120
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
-----------------------------------

local function isNaked(player)
    for i = dsp.slot.MAIN, dsp.slot.BACK do
        if player:getEquipID(i) ~= 0 then return false end
    end
    return true
end

function onTrade(player, npc, trade)
    local grapplingCS = player:getCharVar("thickAsThievesGrapplingCS")

    if grapplingCS >= 2 and grapplingCS <= 7 and npcUtil.tradeHas(trade, 17474) then
        if isNaked(player) then
            player:startEvent(2) -- complete grappling part of the quest
        else
            player:messageSpecial(ID.text.THF_AF_WALL_OFFSET + 2, 0, 17474) -- You try climbing the wall using the [Grapnel], but you are too heavy.
        end
    end
end

function onTrigger(player, npc)
    local thickAsThieves = player:getQuestStatus(WINDURST, dsp.quest.id.windurst.AS_THICK_AS_THIEVES)
    local grapplingCS = player:getCharVar("thickAsThievesGrapplingCS")

    if thickAsThieves == QUEST_ACCEPTED then
        if grapplingCS == 2 then
            local gob = GetMobByID(ID.mob.CLIMBPIX_HIGHRISE)

            if not gob:isSpawned() then
                player:messageSpecial(ID.text.THF_AF_MOB)
                gob:setSpawn(193, 32, 211)
                SpawnMob(ID.mob.CLIMBPIX_HIGHRISE):updateClaim(player)
            end
        elseif grapplingCS >= 0 or grapplingCS <= 7 then
            player:messageSpecial(ID.text.THF_AF_WALL_OFFSET) -- It is impossible to climb this wall with your bare hands.
        elseif grapplingCS == 8 then
            player:messageSpecial(ID.text.THF_AF_WALL_OFFSET + 1) -- There is no longer any need to climb the tower.
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 2 then
        player:setCharVar("thickAsThievesGrapplingCS", 8)
        player:delKeyItem(dsp.ki.FIRST_FORGED_ENVELOPE)
        npcUtil.giveKeyItem(player, dsp.ki.FIRST_SIGNED_FORGED_ENVELOPE)
        player:confirmTrade()
    end
end
