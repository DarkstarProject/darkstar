-----------------------------------
-- Area: Bastok Markets (S)
-- NPC: Engelhart
-- Quest NPC
-- pos -79 -4 -125
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Bastok_Markets_[S]/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(CRYSTAL_WAR,BETTER_PART_OF_VALOR) == QUEST_ACCEPTED) then
        if (player:getVar("BetterPartOfValProg") == 0) then
            player:startEvent(0x0074);
        elseif (player:getVar("BetterPartOfValProg") == 4) then
            player:startEvent(0x0076);
        else
            player:startEvent(0x0075);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR,BETTER_PART_OF_VALOR) == QUEST_COMPLETED and player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_AVAILABLE) then
            player:startEvent(0x0078);
    elseif (player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_ACCEPTED) then
        if (player:getVar("FiresOfDiscProg") < 2) then
            player:startEvent(0x0079);
        elseif (player:getVar("FiresOfDiscProg") == 2) then
            player:startEvent(0x007C);
        elseif (player:getVar("FiresOfDiscProg") == 3) then
            player:startEvent(0x007D);
        elseif (player:getVar("FiresOfDiscProg") == 4) then
            player:startEvent(0x007E);
        elseif (player:getVar("FiresOfDiscProg") == 5) then
            player:startEvent(0x007F);
        elseif (player:getVar("FiresOfDiscProg") == 6) then
            player:startEvent(0x00A4);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR,FIRES_OF_DISCONTENT) == QUEST_COMPLETED) then
        player:startEvent(0x00A5);
    else
        player:startEvent(0x0068);
    end

end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0074) then
        player:setVar("BetterPartOfValProg",1);
        player:delKeyItem(CLUMP_OF_ANIMAL_HAIR);
    elseif (csid == 0x0076) then
        player:delKeyItem(XHIFHUT);
        player:completeQuest(CRYSTAL_WAR,BETTER_PART_OF_VALOR);
        player:addKeyItem(WARNING_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED,WARNING_LETTER);
        player:addGil(GIL_RATE*10000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000);
        player:setVar("BetterPartOfValProg",0);
        player:needToZone(true);
    elseif (csid == 0x0078) then
        player:addQuest(CRYSTAL_WAR,FIRES_OF_DISCONTENT);
        player:delKeyItem(WARNING_LETTER);
    elseif (csid == 0x007C) then
        player:setVar("FiresOfDiscProg",3);
    elseif (csid == 0x007E) then
        player:setVar("FiresOfDiscProg",5);
    elseif (csid == 0x00A4) then
        player:completeQuest(CRYSTAL_WAR,FIRES_OF_DISCONTENT);
        player:addGil(GIL_RATE*10000);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*10000);
        player:setVar("FiresOfDiscProg",0);
    end
end;



