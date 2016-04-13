-----------------------------------
-- Area: Port Windurst
-- NPC: Tokaka
-- Starts & Finishes Repeatable Quest: Something Fishy
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

TokakaSpokenTo = player:getVar("TokakaSpokenTo");
NeedToZone     = player:needToZone();

    if (TokakaSpokenTo == 1 and NeedToZone == false) then
        count = trade:getItemCount();
        BastoreSardine = trade:hasItemQty(4360,1);
        
        if (BastoreSardine == true and count == 1) then
            player:startEvent(0x00d2,GIL_RATE*70,4360);    
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

SomethingFishy = player:getQuestStatus(WINDURST,SOMETHING_FISHY);
    if (player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST) == QUEST_ACCEPTED and player:getVar("BlastFromThePast_Prog") == 0) then
        player:startEvent(0x013e);
        player:setVar("BlastFromThePast_Prog",1);
    elseif (SomethingFishy >= QUEST_ACCEPTED) then
        if (player:needToZone()) then
            player:startEvent(0x00d3);
        else
            player:startEvent(0x00d1,0,4360);
        end
    elseif (SomethingFishy == QUEST_AVAILABLE) then
        player:startEvent(0x00d0,0,4360);
    elseif (player:getQuestStatus(WINDURST,BLAST_FROM_THE_PAST) == QUEST_ACCEPTED and player:getVar("BlastFromThePast_Prog") == 0) then
        player:startEvent(0x013e);
        player:setVar("BlastFromThePast_Prog",1);
    else
        player:startEvent(0x00cf);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x00d0) then
        player:addQuest(WINDURST,SOMETHING_FISHY);
        player:setVar("TokakaSpokenTo",1);
    elseif (csid == 0x00d2) then
        SomethingFishy = player:getQuestStatus(WINDURST,SOMETHING_FISHY);
        
        if (SomethingFishy == QUEST_ACCEPTED) then
            player:completeQuest(WINDURST,SOMETHING_FISHY);
            player:addFame(WINDURST,60);
        else
            player:addFame(WINDURST,10);
        end
        
        player:tradeComplete();
        player:addGil(GIL_RATE*70);
        player:setVar("TokakaSpokenTo",0);
        player:needToZone(true);
    elseif (csid == 0x00d1) then
        player:setVar("TokakaSpokenTo",1);
    end
end;




