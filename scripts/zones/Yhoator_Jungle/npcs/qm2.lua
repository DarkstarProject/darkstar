-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? Used for Norg quest "Stop Your Whining"
-- !pos -94.073 -0.999 22.295 124
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local StopWhining = player:getQuestStatus(OUTLANDS,dsp.quest.id.outlands.STOP_YOUR_WHINING)

    if StopWhining == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.BARREL_OF_OPOOPO_BREW) and player:hasKeyItem(dsp.ki.EMPTY_BARREL) then
        player:messageSpecial(ID.text.TREE_CHECK)
        player:addKeyItem(dsp.ki.BARREL_OF_OPOOPO_BREW) --Filled Barrel
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.BARREL_OF_OPOOPO_BREW)
        player:delKeyItem(dsp.ki.EMPTY_BARREL) --Empty Barrel
    elseif StopWhining == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.BARREL_OF_OPOOPO_BREW) then
        player:messageSpecial(ID.text.TREE_FULL) --Already have full barrel
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 1 then
        player:addKeyItem(dsp.ki.SEA_SERPENT_STATUE)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.SEA_SERPENT_STATUE)
    end
end