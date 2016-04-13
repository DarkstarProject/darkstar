-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Olbergieut 
-- Type: Quest NPC
-- @zone 231
--  @pos 91 0 121
--
-- Starts and Finishes Quest: Gates of Paradise
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    gates = player:getQuestStatus(SANDORIA,GATES_TO_PARADISE);
    if (player:hasKeyItem(SCRIPTURE_OF_WATER) == true) then
        player:startEvent(0x026c);
    elseif (gates == QUEST_ACCEPTED) then
        player:showText(npc, OLBERGIEUT_DIALOG, SCRIPTURE_OF_WIND);
    elseif (player:getFameLevel(SANDORIA) >= 2 and gates == QUEST_AVAILABLE) then
        player:startEvent(0x026b);
    else
        player:startEvent(0x0264);
    end;
    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x026b and option == 0) then 
        player:addQuest(SANDORIA, GATES_TO_PARADISE);
        player:addKeyItem(SCRIPTURE_OF_WIND);
        player:messageSpecial(KEYITEM_OBTAINED, SCRIPTURE_OF_WIND);
    elseif (csid == 0x026c) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 13584);
        else
            player:completeQuest(SANDORIA,GATES_TO_PARADISE);
            player:addFame(SANDORIA,30);
            player:addTitle(THE_PIOUS_ONE);
            player:delKeyItem(SCRIPTURE_OF_WATER);
            player:addItem(13584,1);
            player:messageSpecial(ITEM_OBTAINED,13584);
        end;
    end;
    
end;
