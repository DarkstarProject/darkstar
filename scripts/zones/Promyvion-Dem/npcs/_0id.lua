-----------------------------------
--  Area: Promyvion Dem
--   NPC: Memory Flux
--  !pos 220 0 340 18
-----------------------------------
require("scripts/globals/npc_util")
-----------------------------------

function onTrigger(player,npc)
    if player:getQuestStatus(JEUNO,dsp.quest.id.jeuno.SHADOWS_OF_THE_DEPARTED) == QUEST_ACCEPTED and not player:hasKeyItem(dsp.ki.PROMYVION_DEM_SLIVER) then 
        npcUtil.giveKeyItem(player, dsp.ki.PROMYVION_DEM_SLIVER)
    end
end