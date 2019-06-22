-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: ???
-- Involved in Quests: Acting in Good Faith
-- !pos -17 0 59 195 (I-10)
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getQuestStatus(WINDURST, dsp.quest.id.windurst.ACTING_IN_GOOD_FAITH) == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.SPIRIT_INCENSE) then
        player:startEvent(50)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 50 and option == 0 then
        player:messageSpecial(ID.text.SPIRIT_INCENSE_EMITS_PUTRID_ODOR, dsp.ki.SPIRIT_INCENSE)
        player:delKeyItem(dsp.ki.SPIRIT_INCENSE)
    end
end