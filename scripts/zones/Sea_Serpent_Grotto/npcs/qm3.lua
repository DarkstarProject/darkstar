-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: ??? Used for Norg quest "It's not your vault"
-- !pos -173 26 252 176
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getQuestStatus(OUTLANDS, dsp.quest.id.outlands.ITS_NOT_YOUR_VAULT) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.SEALED_IRON_BOX) then
        player:addKeyItem(dsp.ki.SEALED_IRON_BOX)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SEALED_IRON_BOX)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end