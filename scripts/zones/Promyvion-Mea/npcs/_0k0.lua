-----------------------------------
--  Area: Promyvion Mea
--   NPC: Memory Flux
--  !pos 259 0 179 20
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrigger(player,npc)
    if player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.PROMYVION_MEA_SLIVER) then 
        npcUtil.giveKeyItem(player, dsp.ki.PROMYVION_MEA_SLIVER)
    end
end