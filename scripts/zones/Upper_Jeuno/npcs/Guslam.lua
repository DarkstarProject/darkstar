-----------------------------------
-- Area: Upper Jeuno
-- NPC: Guslam
-- Starts Quest: Borghertz's Hands (AF Hands, Many job)
-- @zone 244
-- !pos -5 1 48
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- If it's the first Hands quest
-----------------------------------

function nbHandsQuestsCompleted(player)

    questNotAvailable = 0;

    for nb = 1, 15, 1 do
        if (player:getQuestStatus(JEUNO,43 + nb) ~= QUEST_AVAILABLE) then
            questNotAvailable = questNotAvailable + 1;
        end
    end

    return questNotAvailable;

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getMainLvl() >= 50 and player:getVar("BorghertzAlreadyActiveWithJob") == 0) then
        if (player:getMainJob() == JOBS.WAR and
           player:getQuestStatus(BASTOK,THE_TALEKEEPER_S_TRUTH) ~= QUEST_AVAILABLE and
           player:getQuestStatus(JEUNO,BORGHERTZ_S_WARRING_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for WAR
        elseif (player:getMainJob() == JOBS.MNK and
               player:getQuestStatus(BASTOK,THE_FIRST_MEETING) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_STRIKING_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for MNK
        elseif (player:getMainJob() == JOBS.WHM and
               player:getQuestStatus(SANDORIA,PRELUDE_OF_BLACK_AND_WHITE) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_HEALING_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for WHM
        elseif (player:getMainJob() == JOBS.BLM and
               player:getQuestStatus(WINDURST,RECOLLECTIONS) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_SORCEROUS_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for BLM
        elseif (player:getMainJob() == JOBS.RDM and
               player:getQuestStatus(SANDORIA,ENVELOPED_IN_DARKNESS) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_VERMILLION_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for RDM
        elseif (player:getMainJob() == JOBS.THF and
               player:getQuestStatus(WINDURST,AS_THICK_AS_THIEVES) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_SNEAKY_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for THF
        elseif (player:getMainJob() == JOBS.PLD and
               player:getQuestStatus(SANDORIA,A_BOY_S_DREAM) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_STALWART_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for PLD
        elseif (player:getMainJob() == JOBS.DRK and
               player:getQuestStatus(BASTOK,DARK_PUPPET) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_SHADOWY_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for DRK
        elseif (player:getMainJob() == JOBS.BST and
               player:getQuestStatus(JEUNO,SCATTERED_INTO_SHADOW) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_WILD_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for BST
        elseif (player:getMainJob() == JOBS.BRD and
               player:getQuestStatus(JEUNO,THE_REQUIEM) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_HARMONIOUS_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for BRD
        elseif (player:getMainJob() == JOBS.RNG and
               player:getQuestStatus(WINDURST,FIRE_AND_BRIMSTONE) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_CHASING_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for RNG
        elseif (player:getMainJob() == JOBS.SAM and
               player:getQuestStatus(OUTLANDS,YOMI_OKURI) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_LOYAL_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for SAM
        elseif (player:getMainJob() == JOBS.NIN and
               player:getQuestStatus(OUTLANDS,I_LL_TAKE_THE_BIG_BOX) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_LURKING_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for NIN
        elseif (player:getMainJob() == JOBS.DRG and
               player:getQuestStatus(SANDORIA,CHASING_QUOTAS) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_DRAGON_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for DRG
        elseif (player:getMainJob() == JOBS.SMN and
               player:getQuestStatus(WINDURST,CLASS_REUNION) ~= QUEST_AVAILABLE and
               player:getQuestStatus(JEUNO,BORGHERTZ_S_CALLING_HANDS) == QUEST_AVAILABLE) then
            player:startEvent(0x009b); -- Start Quest for SMN
        else
            player:startEvent(0x009a); -- Standard dialog
        end
    elseif (player:getVar("BorghertzAlreadyActiveWithJob") >= 1 and player:hasKeyItem(OLD_GAUNTLETS) == false) then
        player:startEvent(0x002b); -- During Quest before KI obtained
    elseif (player:hasKeyItem(OLD_GAUNTLETS) == true) then
        player:startEvent(0x001a); -- Dialog with Old Gauntlets KI

        if (nbHandsQuestsCompleted(player) == 1) then
            player:setVar("BorghertzHandsFirstTime",1);
        else
            player:setVar("BorghertzCS",1);
        end
    else
        player:startEvent(0x009a); -- Standard dialog
    end

end;

-- 0x009a Standard dialog
-- 0x009b Start Quest
-- 0x002b During Quest before KI obtained
-- 0x001a Dialog avec Old Gauntlets KI
-- 0x009c During Quest after Old Gauntlets KI ?

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

    if (csid == 0x009b) then
        NumQuest = 43 + player:getMainJob();
        player:addQuest(JEUNO,NumQuest);
        player:setVar("BorghertzAlreadyActiveWithJob",player:getMainJob());
    end

end;