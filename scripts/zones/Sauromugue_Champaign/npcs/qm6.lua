-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: qm6 (???) (Tower 6)
-- Involved in Quest: THF AF "As Thick As Thieves"
-- !pos 363.481 23.600 6.335 120
-----------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
    local grapplingCS = player:getVar("thickAsThievesGrapplingCS")

    if grapplingCS >= 2 and grapplingCS <= 7 and npcUtil.tradeHas(trade, 17474) then
        player:messageSpecial(ID.text.THF_AF_WALL_OFFSET + 3, 0, 17474) -- You cannot get a decent grip on the wall using the [Grapnel].
    end
end

function onTrigger(player, npc)
    local thickAsThieves = player:getQuestStatus(WINDURST, dsp.quest.id.windurst.AS_THICK_AS_THIEVES)
    local grapplingCS = player:getVar("thickAsThievesGrapplingCS")

    if thickAsThieves == QUEST_ACCEPTED then
        if grapplingCS == 6 then
            local gob = GetMobByID(ID.mob.CLIMBPIX_HIGHRISE)

            if not gob:isSpawned() then
                player:messageSpecial(ID.text.THF_AF_MOB)
                gob:setSpawn(371, 24, 8)
                SpawnMob(ID.mob.CLIMBPIX_HIGHRISE):updateClaim(player)
            end
        elseif grapplingCS >= 0 or grapplingCS <= 7 then
            player:messageSpecial(ID.text.THF_AF_WALL_OFFSET)
        end
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
