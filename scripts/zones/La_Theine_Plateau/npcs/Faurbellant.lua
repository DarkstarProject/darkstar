-----------------------------------
-- Area: La Theine Plateau
--  NPC: Faurbellant
-- Type: Quest NPC
-- Involved in Quest: Gates of Paradise
-- !pos 484 24 -89 102
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
local ID = require("scripts/zones/La_Theine_Plateau/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local gates = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.GATES_TO_PARADISE);
    if (gates == QUEST_COMPLETED) then
        player:showText(npc, ID.text.FAURBELLANT_4);
    elseif (gates == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.SCRIPTURE_OF_WIND) == true) then
            player:showText(npc, ID.text.FAURBELLANT_2, 0, dsp.ki.SCRIPTURE_OF_WIND);
            player:delKeyItem(dsp.ki.SCRIPTURE_OF_WIND);
            player:addKeyItem(dsp.ki.SCRIPTURE_OF_WATER);
            player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.SCRIPTURE_OF_WATER)
        else
            player:showText(npc, ID.text.FAURBELLANT_3, dsp.ki.SCRIPTURE_OF_WATER);
        end;
    else
        player:showText(npc, ID.text.FAURBELLANT_1);
    end;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
