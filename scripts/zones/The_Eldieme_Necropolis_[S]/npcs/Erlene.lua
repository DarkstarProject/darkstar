-----------------------------------
-- Area: The Eldieme Necropolis (S)
-- NPC:  Erlene
-- Involved in Quest: "A Little Knowledge"
-- @pos 376.936 -39.999 17.914 175
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Eldieme_Necropolis_[S]/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local ALittleKnowledge = player:getQuestStatus(CRYSTAL_WAR, A_LITTLE_KNOWLEDGE);
    local ALittleKnowledgeProgress = player:getVar("ALittleKnowledge");
	
    if (ALittleKnowledge == QUEST_ACCEPTED and ALittleKnowledgeProgress == 1) then
        if (trade:hasItemQty(2550, 12) and trade:getGil() == 0 and trade:getItemCount() == 12) then
            if( player:getMainJob() == JOB_BLM or
                player:getMainJob() == JOB_RDM or
                player:getMainJob() == JOB_SMN or
                player:getMainJob() == JOB_BLU) then
                player:startEvent(12, 1);
            else
                player:startEvent(12);
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local ALittleKnowledge = player:getQuestStatus(CRYSTAL_WAR, A_LITTLE_KNOWLEDGE);
    local ALittleKnowledgeProgress = player:getVar("ALittleKnowledge");
    local mLvl = player:getMainLvl();
    local mJob = player:getMainJob();
    local onSabbatical = player:getQuestStatus(CRYSTAL_WAR,ON_SABBATICAL);
    local onSabbaticalProgress = player:getVar("OnSabbatical");

    if (ENABLE_WOTG == 1 and ALittleKnowledge == QUEST_AVAILABLE) then
        if player:getMainLvl() >= ADVANCED_JOB_LEVEL then
            player:startEvent(10,1);
        else
            player:startEvent(10);
        end
    elseif (ALittleKnowledgeProgress == 1 and ALittleKnowledge == QUEST_ACCEPTED) then
        player:startEvent(11);
    elseif (ALittleKnowledgeProgress == 2 and ALittleKnowledge == QUEST_ACCEPTED) then
        if (player:hasStatusEffect(EFFECT_MANAFONT) or
            player:hasStatusEffect(EFFECT_CHAINSPELL) or
            player:hasStatusEffect(EFFECT_ASTRAL_FLOW) or
            player:hasStatusEffect(EFFECT_AZURE_LORE)) then
            player:startEvent(14);
        else
            player:startEvent(13);
        end
    elseif (ALittleKnowledge == QUEST_COMPLETED) then
        if (player:getMainJob() == JOB_SCH and player:getMainLvl() >= 5 and not (player:hasSpell(478) and player:hasSpell(502))) then
            player:startEvent(47);
        else
            player:startEvent(15);
        end
    elseif (onSabbatical == QUEST_AVAILABLE and mJob == JOB_SCH and mLvl >= AF1_QUEST_LEVEL) then
        if (onSabbaticalProgress == 0) then
            player:startEvent(18);
        else
            player:startEvent(19);
        end
    elseif (onSabbatical == QUEST_ACCEPTED and onSabbaticalProgress == 3) then
        player:startEvent(20);
    end
	
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
	
    if (csid == 10 and option == 0) then
        player:addQuest(CRYSTAL_WAR, A_LITTLE_KNOWLEDGE);
        player:setVar("ALittleKnowledge", 1);
    elseif (csid == 12) then
        player:tradeComplete();
        player:setVar("ALittleKnowledge", 2);
    elseif (csid == 14) then
        player:addKeyItem(GRIMOIRE);
        player:unlockJob(JOB_SCH);
        player:addTitle(SCHULTZ_SCHOLAR);
        player:setVar("ALittleKnowledge", 0);
        player:setVar("SheetsofVellum", 0);
        player:messageSpecial(YOU_CAN_NOW_BECOME_A_SCHOLAR);
        player:completeQuest(CRYSTAL_WAR, A_LITTLE_KNOWLEDGE);
    elseif (csid == 47) then
        if (player:canLearnSpell(478) and player:canLearnSpell(502)) then
            player:addSpell(478, true);
            player:addSpell(502, true);
            player:messageSpecial(YOU_LEARN_EMBRAVA_AND_KAUSTRA);
        end
    elseif (csid == 18) then
        player:addQuest(CRYSTAL_WAR, ON_SABBATICAL);
        player:addKeyItem(ULBRECHTS_SEALED_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED, ULBRECHTS_SEALED_LETTER);
        player:setVar("OnSabbatical", 1);
    elseif (csid == 20) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED);
        else
            player:delKeyItem(ULBRECHTS_SEALED_LETTER);
            player:delKeyItem(SCHULTS_SEALED_LETTER);
            player:completeQuest(CRYSTAL_WAR,ON_SABBATICAL);
            player:addItem(6058); --klimaform
            player:messageSpecial(ITEM_OBTAINED, 6058);
            player:setVar("onSabbatical",0);
            player:needToZone(true);
        end
    end
end;
