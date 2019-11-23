-----------------------------------
-- Area: Jugner Forest
--  NPC: Signpost
-- Involved in Quest: Grimy Signposts
-------------------------------------
local ID = require("scripts/zones/Jugner_Forest/IDs")
require("scripts/globals/quests")
-------------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local offset = 3 - (npc:getID() - ID.npc.SIGNPOST_OFFSET)

    if
        player:getQuestStatus(SANDORIA, dsp.quest.id.sandoria.GRIMY_SIGNPOSTS) == QUEST_ACCEPTED and
        offset >= 0 and offset <= 3 and
        not player:getMaskBit(player:getCharVar("CleanSignPost"), offset)
    then
        player:startEvent(6 + offset, 1)
    else
        player:startEvent(1 + offset)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid >= 6 and csid <= 9 and option == 1 then
        player:setMaskBit(player:getCharVar("CleanSignPost"), "CleanSignPost", csid - 6, true)
    end
end