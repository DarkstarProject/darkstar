-----------------------------------
-- Area: The Eldieme Necropolis
--  NPC: Sarcophagus
-- Involved in Quests: The Requiem (BARD AF2), A New Dawn (BST AF3)
-- !pos -420 8 500 195
-----------------------------------
local ID = require("scripts/zones/The_Eldieme_Necropolis/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player, npc, trade)
    local offset = npc:getID() - ID.npc.SARCOPHAGUS_OFFSET

    -- THE REQUIEM (holy water)
    if
        player:getVar("TheRequiemCS") == 3 and
        player:getVar("TheRequiemYumKilled") == 0 and
        npcUtil.tradeHas(trade, 4154) and
        offset == player:getVar("TheRequiemRandom") - 1 and
        npcUtil.popFromQM(player, npc, {ID.mob.YUM_KIMIL, ID.mob.YUM_KIMIL + 1, ID.mob.YUM_KIMIL + 2}, {hide = 0})
    then
        player:confirmTrade()
        player:messageSpecial(ID.text.SENSE_OF_FOREBODING)
        player:setVar("TheRequiemAlreadyPoped", 1)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENED)
    end
end

function onTrigger(player, npc)
    local offset = npc:getID() - ID.npc.SARCOPHAGUS_OFFSET

    -- A NEW DAWN (Beastmaster AF3)
    if player:getQuestStatus(JEUNO, dsp.quest.id.jeuno.A_NEW_DAWN) == QUEST_ACCEPTED and npc:getID() == ID.npc.SARCOPHAGUS_OFFSET then
        local aNewDawnEvent = player:getVar("ANewDawn_Event")

        if aNewDawnEvent == 4 then
            npcUtil.popFromQM(player, npc, {ID.mob.STURM, ID.mob.TAIFUN, ID.mob.TROMBE}, {hide = 0})
        elseif aNewDawnEvent == 5 then
            player:startEvent(45)
        end

    -- THE REQUIEM (Bard AF2)
    elseif offset == player:getVar("TheRequiemRandom") - 1 then
        if player:getVar("TheRequiemYumKilled") == 1 then
            player:startEvent(46)
        elseif player:getVar("TheRequiemAlreadyPoped") == 1 and npcUtil.popFromQM(player, npc, {ID.mob.YUM_KIMIL, ID.mob.YUM_KIMIL + 1, ID.mob.YUM_KIMIL + 2}, {hide = 0}) then
            player:messageSpecial(ID.text.SENSE_OF_FOREBODING)
        else
            player:messageSpecial(ID.text.SARCOPHAGUS_CANNOT_BE_OPENED)
        end

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ID.text.SARCOPHAGUS_CANNOT_BE_OPENED)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- THE REQUIEM
    if csid == 46 then
        player:setVar("TheRequiemCS", 0)
        player:setVar("TheRequiemYumKilled", 0)
        player:setVar("TheRequiemRandom", 0)
        player:setVar("TheRequiemAlreadyPoped", 0)
        npcUtil.giveKeyItem(player, dsp.ki.STAR_RING1)

    -- A NEW DAWN
    elseif csid == 45 and npcUtil.completeQuest(player, JEUNO, dsp.quest.id.jeuno.A_NEW_DAWN, {item = 14222, title = dsp.title.PARAGON_OF_BEASTMASTER_EXCELLENCE}) then
        player:setVar("ANewDawn_Event", 6)
        player:delKeyItem(dsp.ki.TAMERS_WHISTLE)
    end
end
