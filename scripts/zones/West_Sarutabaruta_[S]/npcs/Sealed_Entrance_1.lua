-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Sealed Entrance (Sealed_Entrance_1)
-- !pos -245.000 -18.100 660.000 95
-----------------------------------
local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrigger(player,npc)
    local snakeOnThePlains = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.SNAKE_ON_THE_PLAINS)
    local maskBit1 = player:getMaskBit(player:getVar("SEALED_DOORS"), 0)
    local maskBit2 = player:getMaskBit(player:getVar("SEALED_DOORS"), 1)
    local maskBit3 = player:getMaskBit(player:getVar("SEALED_DOORS"), 2)

    if snakeOnThePlains == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY) then
        if not maskBit1 then
            if not maskBit2 or not maskBit3 then
                player:setMaskBit(player:getVar("SEALED_DOORS"), "SEALED_DOORS", 0, true)
                player:messageSpecial(ID.text.DOOR_OFFSET + 1, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
            else
                player:setMaskBit(player:getVar("SEALED_DOORS"), "SEALED_DOORS", 0, true)
                player:messageSpecial(ID.text.DOOR_OFFSET + 4, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
                player:delKeyItem(dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
            end
        else
            player:messageSpecial(ID.text.DOOR_OFFSET + 2, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
        end
    elseif snakeOnThePlains == QUEST_COMPLETED then
        player:messageSpecial(ID.text.DOOR_OFFSET + 2, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
    else
        player:messageSpecial(ID.text.DOOR_OFFSET + 3)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end