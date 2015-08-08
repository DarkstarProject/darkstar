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
        player:setVar("BetterPartOfValProg",0);
        player:needToZone(true);
    end
end;



