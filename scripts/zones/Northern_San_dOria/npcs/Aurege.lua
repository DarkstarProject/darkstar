-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Aurege
-- Type: Quest Giver NPC
--  Starts Quest: Exit the Gambler
--  @zone 231
-- !pos -156.253 11.999 253.691
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
        exitTheGambler = player:getQuestStatus(SANDORIA,EXIT_THE_GAMBLER);

        if (player:hasKeyItem(MAP_OF_KING_RANPERRES_TOMB)) then
           player:startEvent(514);
        elseif (exitTheGambler == QUEST_COMPLETED) then
           player:startEvent(516);
        else
           player:startEvent(521);
        end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    exitTheGambler = player:getQuestStatus(SANDORIA,EXIT_THE_GAMBLER);

    if (exitTheGambler == QUEST_AVAILABLE) then
       player:addQuest(SANDORIA,EXIT_THE_GAMBLER);
    elseif (exitTheGambler == QUEST_COMPLETED and player:hasKeyItem(MAP_OF_KING_RANPERRES_TOMB) == false) then
           player:messageSpecial(KEYITEM_OBTAINED,MAP_OF_KING_RANPERRES_TOMB);
           player:addKeyItem(MAP_OF_KING_RANPERRES_TOMB);
       player:addTitle(DAYBREAK_GAMBLER);
           player:addFame(SANDORIA,30);
    end
end;

