-----------------------------------
-- Area: Metalworks
-- NPC:  Salim
-- Type: Quest NPC for Bait and Switch
-- !pos -59.290 -10.000 21.780 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local pFame = player:getFameLevel(BASTOK);
    local BaitandSwitch = player:getQuestStatus(NATION_BASTOK,BAIT_AND_SWITCH);
    local tally = player:getVar("Bait_and_Switch_Conquest_Tally");
    local active = player:getLocalVar("Bait_and_Switch_Quest_Active");
    local BnSDialogue = player:getLocalVar("Bait_and_Switch_Quest_NPCs");
    local timesUP = false;
    if (os.time() > player:getLocalVar("Bait_and_Switch_Time_Limit") and item == 6) then
        timesUP = true;
    end

    if (player:getMaskBit(BnSDialogue,8) == true and timesUP == false) then
        player:startEvent(0x0385);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",BnSDialogue - 256);
    elseif (pFame >=3 and tally < os.time()) then
        if (BaitandSwitch < QUEST_COMPLETED) then
            if (active == 0) then
                player:startEvent(0x0383);
            else
                player:startEvent(0x0190);
            end
        elseif (BaitandSwitch == QUEST_COMPLETED) then
            if (active == 0) then
                player:startEvent(0x0383,0,0,0,0,0,0,2);
            else
                player:startEvent(0x0190);
            end
        end
    else
        player:startEvent(0x0190);
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

    if (csid == 0x0383) then
        if (player:getQuestStatus(NATION_BASTOK,BAIT_AND_SWITCH) == QUEST_AVAILABLE) then
            player:addQuest(NATION_BASTOK,BAIT_AND_SWITCH);
            player:setLocalVar("Bait_and_Switch_Quest_Active",1);
        else
            player:setLocalVar("Bait_and_Switch_Quest_Active",1);
        end
    end
end;

