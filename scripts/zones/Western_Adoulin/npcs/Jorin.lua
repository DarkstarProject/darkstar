-----------------------------------
--  Area: Western Adoulin
--  NPC: Jorin
--  Type: Standard NPC and Quest Giver
--  Starts, Involved with, and Finishes Quest: 'The Old Man and the Harpoon'
--  @zone 256
--  @pos 92 32 152 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Western_Adoulin/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local TOMATH = player:getQuestStatus(ADOULIN, THE_OLD_MAN_AND_THE_HARPOON);
    if (TOMATH == QUEST_ACCEPTED) then
        if (player:hasKeyItem(EXTRAVAGANT_HARPOON)) then
            -- Finishing Quest: 'The Old Man and the Harpoon'
            player:startEvent(0x09EE);
        else
            -- Dialgoue during Quest: 'The Old Man and the Harpoon'
            player:startEvent(0x09ED);
        end
    elseif (TOMATH == QUEST_AVAILABLE) then
        -- Starts Quest: 'The Old Man and the Harpoon'
        player:startEvent(0x09EC);  
    else
        -- Standard dialogue
        player:startEvent(0x0230);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x09EC) then
        -- Starting Quest: 'The Old Man and the Harpoon'
        player:addQuest(ADOULIN, THE_OLD_MAN_AND_THE_HARPOON);
        player:addKeyItem(BROKEN_HARPOON);
        player:messageSpecial(KEYITEM_OBTAINED, BROKEN_HARPOON);
    elseif (csid == 0x09EE) then
        -- Finishing Quest: 'The Old Man and the Harpoon'
        player:completeQuest(ADOULIN, THE_OLD_MAN_AND_THE_HARPOON);
        player:addExp(500 * EXP_RATE);
        player:addCurrency('bayld', 300 * BAYLD_RATE);
        player:messageSpecial(BAYLD_OBTAINED, 300 * BAYLD_RATE);
        player:delKeyItem(EXTRAVAGANT_HARPOON);
        player:addFame(ADOULIN);
    end
end;
