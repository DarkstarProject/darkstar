-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Aurege
-- Type: Quest Giver NPC
--  Starts Quest: Exit the Gambler
-- !pos -156.253 11.999 253.691 231
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local exitTheGambler = player:getQuestStatus(SANDORIA,EXIT_THE_GAMBLER);

    if (player:hasKeyItem(dsp.ki.MAP_OF_KING_RANPERRES_TOMB)) then
        player:startEvent(514);
    elseif (exitTheGambler == QUEST_COMPLETED) then
        player:startEvent(516);
    else
        player:startEvent(521);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    local exitTheGambler = player:getQuestStatus(SANDORIA,EXIT_THE_GAMBLER);

    if (exitTheGambler == QUEST_AVAILABLE) then
        player:addQuest(SANDORIA,EXIT_THE_GAMBLER);
    elseif (exitTheGambler == QUEST_COMPLETED and player:hasKeyItem(dsp.ki.MAP_OF_KING_RANPERRES_TOMB) == false) then
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.MAP_OF_KING_RANPERRES_TOMB);
        player:addKeyItem(dsp.ki.MAP_OF_KING_RANPERRES_TOMB);
        player:addTitle(dsp.title.DAYBREAK_GAMBLER);
        player:addFame(SANDORIA,30);
    end
end;