-----------------------------------
--  Area: Promyvion Holla
--   NPC: Memory Flux
--  !pos 99 -1 -140 16
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrigger(player,npc)
    if player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.PROMYVION_HOLLA_SLIVER) then 
		npcUtil.giveKeyItem(player, dsp.ki.PROMYVION_HOLLA_SLIVER)
    end
end