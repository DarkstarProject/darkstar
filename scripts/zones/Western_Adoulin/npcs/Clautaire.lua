-----------------------------------
--  Area: Western Adoulin
--  NPC: Clautaire
--  Type: Standard NPC and Quest Giver
--  Starts, Involved with, and Finishes Quest: 'F.A.I.L.ure Is Not an Option'
--  @zone 256
--  @pos 44 4 -159 256
-----------------------------------
package.loaded["scripts/zones/Western_Adoulin/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/status");
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
    local FINAO = player:getQuestStatus(ADOULIN, FAILURE_IS_NOT_AN_OPTION);
    if (FINAO == QUEST_ACCEPTED) then
        if (player:hasKeyItem(HUNK_OF_BEDROCK)) then
            -- Finishing Quest: 'F.A.I.L.ure Is Not an Option'
            player:startEvent(0x004C);
        else
            -- Dialgoue during Quest: 'F.A.I.L.ure Is Not an Option'
            player:startEvent(0x004D);
        end
    elseif ((FINAO == QUEST_AVAILABLE) and (player:getFameLevel(ADOULIN) >= 4) and player:hasKeyItem(FAIL_BADGE)) then
        -- Starting Quest: 'F.A.I.L.ure Is Not an Option'
        player:startEvent(0x004E);
    else
        -- Standard dialogue
        player:startEvent(0x0221);
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
    if (csid == 0x004E) then
        -- Starting Quest: 'F.A.I.L.ure Is Not an Option'
        player:addQuest(ADOULIN, FAILURE_IS_NOT_AN_OPTION);
    elseif (csid == 0x004C) then
        -- Finishing Quest: 'F.A.I.L.ure Is Not an Option'
        player:delKeyItem(HUNK_OF_BEDROCK);
        player:completeQuest(ADOULIN, FAILURE_IS_NOT_AN_OPTION);
        player:addExp(1000 * EXP_RATE);
        player:addCurrency('bayld', 500 * BAYLD_RATE);
        player:messageSpecial(BAYLD_OBTAINED, 500 * BAYLD_RATE);
        player:addFame(ADOULIN);
    end
end;
