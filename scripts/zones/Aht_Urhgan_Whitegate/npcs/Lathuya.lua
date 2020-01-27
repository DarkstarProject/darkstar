-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Lathuya
-- Standard Info NPC
-- Involved in quests: Omens (BLU AF2)
-- !pos -95.081 -6.000 31.638 50
-----------------------------------
require("scripts/globals/quests")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    -- OMENS
    if player:hasKeyItem(dsp.ki.SEALED_IMMORTAL_ENVELOPE) then
        if player:getCharVar("BluAf2CS") == 3 then
            player:startEvent(714) -- BLU AF2: Master location
        elseif player:getCharVar("BluAf2CS") == 4 then
            player:startEvent(715) -- BLU AF2: Reminds master location
        elseif player:getCharVar("BluAf2CS") == 5 then
            player:startEvent(716) -- BLU AF2: Quest Completed
        end
    else
        player:startEvent(770)
    end
end
function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- OMENS
    if csid == 714 then
        player:setCharVar("BluAf2CS",4)
    elseif csid == 716 then
        npcUtil.completeQuest(player, AHT_URHGAN, dsp.quest.id.ahtUrhgan.OMENS, {
            item = 15684,
            title = dsp.title.IMMORTAL_LION,
            var = { BluAf2CS }
        })
        player:delKeyItem(dsp.ki.SEALED_IMMORTAL_ENVELOPE)
    end
end