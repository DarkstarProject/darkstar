-----------------------------------
-- Area: Bastok Markets (S)
--  NPC: Engelhart
-- Quest NPC
-- pos -79 -4 -125
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Markets_[S]/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,BETTER_PART_OF_VALOR) == QUEST_ACCEPTED) then
        if (player:getVar("BetterPartOfValProg") == 0) then
            player:startEvent(116);
        elseif (player:getVar("BetterPartOfValProg") == 4) then
            player:startEvent(118);
        else
            player:startEvent(117);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR,BETTER_PART_OF_VALOR) == QUEST_COMPLETED and player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_AVAILABLE) then
            player:startEvent(120);
    elseif (player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_ACCEPTED) then
        if (player:getVar("FiresOfDiscProg") < 2) then
            player:startEvent(121);
        elseif (player:getVar("FiresOfDiscProg") == 2) then
            player:startEvent(124);
        elseif (player:getVar("FiresOfDiscProg") == 3) then
            player:startEvent(125);
        elseif (player:getVar("FiresOfDiscProg") == 4) then
            player:startEvent(126);
        elseif (player:getVar("FiresOfDiscProg") == 5) then
            player:startEvent(127);
        elseif (player:getVar("FiresOfDiscProg") == 6) then
            player:startEvent(164);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_COMPLETED) then
        player:startEvent(165);
    else
        player:startEvent(104);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 116) then
        player:setVar("BetterPartOfValProg",1);
        player:delKeyItem(CLUMP_OF_ANIMAL_HAIR);
    elseif (csid == 118) then
        player:delKeyItem(XHIFHUT);
        player:completeQuest(CRYSTAL_WAR,BETTER_PART_OF_VALOR);
        player:addKeyItem(WARNING_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED,WARNING_LETTER);
        player:addGil(GIL_RATE*10000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000);
        player:setVar("BetterPartOfValProg",0);
        player:needToZone(true);
    elseif (csid == 120) then
        player:addQuest(CRYSTAL_WAR,FIRES_OF_DISCONTENT);
        player:delKeyItem(WARNING_LETTER);
    elseif (csid == 124) then
        player:setVar("FiresOfDiscProg",3);
    elseif (csid == 126) then
        player:setVar("FiresOfDiscProg",5);
    elseif (csid == 164) then
        player:completeQuest(CRYSTAL_WAR,FIRES_OF_DISCONTENT);
        player:addGil(GIL_RATE*10000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000);
        player:setVar("FiresOfDiscProg",0);
    end
end;

