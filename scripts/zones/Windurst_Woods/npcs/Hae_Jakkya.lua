-----------------------------------
-- Area: Windurst Woods
--  NPC: Hae Jakkya
-- Working 100%
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local chasingStatus = player:getQuestStatus(WINDURST, dsp.quest.id.windurst.CHASING_TALES)

    if player:hasKeyItem(dsp.ki.A_SONG_OF_LOVE) then
        player:startEvent(406)
    elseif player:getVar("CHASING_TALES_TRACK_BOOK") == 1 then
        player:startEvent(403)
    elseif player:hasKeyItem(dsp.ki.OVERDUE_BOOK_NOTIFICATION) then
        player:startEvent(402) -- Neeed CS here
    else
        player:startEvent(41)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 402 then
        player:setVar("CHASING_TALES_TRACK_BOOK", 1)
    end
end
