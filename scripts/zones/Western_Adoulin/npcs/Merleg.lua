-----------------------------------
--  Area: Western Adoulin
--  NPC: Merleg
--  Type: Standard NPC and Quest Giver
--  Starts, Involved with, and Finishes Quest: 'A Pioneers Best (Imaginary) Friend'
--  @zone 256
--  @pos 34 0 -131 256
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
    local APBIF = player:getQuestStatus(ADOULIN, A_PIONEERS_BEST_IMAGINARY_FRIEND);
    if (APBIF == QUEST_ACCEPTED) then
        if (player:hasStatusEffect(EFFECT_IONIS)) then
            -- Finishing Quest: 'A Pioneers Best (Imaginary) Friend'
            player:startEvent(0x09DA);
        else
            -- Dialgoue during Quest: 'A Pioneers Best (Imaginary) Friend'
            player:startEvent(0x09D9);
        end
    elseif (APBIF == QUEST_AVAILABLE) then
        player:startEvent(0x09D8);
    else
        -- Standard dialogue
        player:startEvent(0x021F);
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
    if (csid == 0x09D8) then
        -- Starting Quest: 'A Pioneers Best (Imaginary) Friend'
        player:addQuest(ADOULIN, A_PIONEERS_BEST_IMAGINARY_FRIEND);
        if (player:hasStatusEffect(EFFECT_IONIS)) then
            -- Finishes quest if Ionis is already active
            player:startEvent(0x09DA);
        end
    elseif (csid == 0x09DA) then
        -- Finishing Quest: 'A Pioneers Best (Imaginary) Friend'
        player:completeQuest(ADOULIN, A_PIONEERS_BEST_IMAGINARY_FRIEND);
        player:addExp(500 * EXP_RATE);
        player:addCurrency('bayld', 200 * BAYLD_RATE);
        player:messageSpecial(BAYLD_OBTAINED, 200 * BAYLD_RATE);
        player:addKeyItem(FAIL_BADGE);
        player:messageSpecial(KEYITEM_OBTAINED, FAIL_BADGE);
        player:addFame(ADOULIN);
    end
end;
