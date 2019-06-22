-----------------------------------
-- Area: Sea Serpent Grotto
--  NPC: ??? Used for Norg quest "The Sahagin's Stash"
-- !pos 295.276 27.129 213.043 176
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getQuestStatus(OUTLANDS, dsp.quest.id.outlands.THE_SAHAGINS_STASH) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.SEA_SERPENT_STATUE) then
        player:startEvent(1)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 1 then
        player:addKeyItem(dsp.ki.SEA_SERPENT_STATUE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SEA_SERPENT_STATUE)
    end
end