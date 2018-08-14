-----------------------------------
-- Area: La Theine Plateau
--  NPC: Faurbellant
-- Type: Quest NPC
-- Involved in Quest: Gates of Paradise
-- !pos 484 24 -89 102
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/La_Theine_Plateau/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local gates = player:getQuestStatus(SANDORIA,GATES_TO_PARADISE);
    if (gates == QUEST_COMPLETED) then
        player:showText(npc, FAURBELLANT_4);
    elseif (gates == QUEST_ACCEPTED) then
        if (player:hasKeyItem(dsp.ki.SCRIPTURE_OF_WIND) == true) then
            player:showText(npc, FAURBELLANT_2, 0, dsp.ki.SCRIPTURE_OF_WIND);
            player:delKeyItem(dsp.ki.SCRIPTURE_OF_WIND);
            player:addKeyItem(dsp.ki.SCRIPTURE_OF_WATER);
            player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.SCRIPTURE_OF_WATER)
        else
            player:showText(npc, FAURBELLANT_3, dsp.ki.SCRIPTURE_OF_WATER);
        end;
    else
        player:showText(npc, FAURBELLANT_1);
    end;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
