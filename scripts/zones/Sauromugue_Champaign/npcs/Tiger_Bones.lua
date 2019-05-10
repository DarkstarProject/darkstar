-----------------------------------
-- Area: Sauromugue Champaign
--  NPC: Tiger Bones
-- Involed in Quest: The Fanged One
-- !pos 666 -8 -379 120
-------------------------------------
local ID = require("scripts/zones/Sauromugue_Champaign/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-------------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local fangedOne = player:getQuestStatus(WINDURST, dsp.quest.id.windurst.THE_FANGED_ONE)
    local fangedOneCS = player:getVar("TheFangedOneCS")

    -- THE FANGED ONE
    if fangedOne == QUEST_ACCEPTED and fangedOneCS == 1 and not GetMobByID(ID.mob.OLD_SABERTOOTH):isSpawned() then
        SpawnMob(ID.mob.OLD_SABERTOOTH):addStatusEffect(dsp.effect.POISON, 40, 10, 210)
        player:messageSpecial(ID.text.OLD_SABERTOOTH_DIALOG_I)
    elseif fangedOne == QUEST_ACCEPTED and fangedOneCS == 2 and not player:hasKeyItem(dsp.ki.OLD_TIGERS_FANG) then
        player:addKeyItem(dsp.ki.OLD_TIGERS_FANG)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.OLD_TIGERS_FANG)
        player:setVar("TheFangedOneCS", 0)

    -- DEFAULT DIALOG
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end
