-----------------------------------
-- Area: Metalworks
-- NPC: Hungry Wolf
-- Type: Quest Giver / Involved in Quest Bait and Switch
-- !pos -25.861 -11 -30.172 237
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-- Updated for "Smoke on the Mountain" by EccentricAnata 03.22.13
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/baitandswitch");
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(BASTOK,SMOKE_ON_THE_MOUNTAIN) ~= QUEST_AVAILABLE and
        trade:hasItemQty(4395,1) and trade:getItemCount() == 1) then
            player:startEvent(0x01ad);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local s_table = Switch_Table[player:getLocalVar("Bait_and_Switch_Quest_Order")];
    local item = CheckOptionForItem(player);
    local SmokeOnTheMountain = player:getQuestStatus(BASTOK,SMOKE_ON_THE_MOUNTAIN);
    local BnSDialogue = player:getLocalVar("Bait_and_Switch_Quest_NPCs");
    local active = player:getLocalVar("Bait_and_Switch_Quest_Active");
    local luto = (player:getLocalVar("Luto_Caught"));
    local miledo = (player:getLocalVar("Miledo_Caught"));
    local keyParam = 0;
        if (luto == 1) then
            keyParam = 2;
        elseif (miledo == 1) then
            keyParam = 1;
        end
    local timesUP = false;
    if (os.time() > player:getLocalVar("Bait_and_Switch_Time_Limit") and item == 6) then
        timesUP = true;
    end

    if (active == 8) then
        player:startEvent(0x0395,0,keyParam);
    elseif (player:getMaskBit(BnSDialogue,1) == true and timesUP == false and active == 1) then
        player:startEvent(0x0389,CheckBaitProgress(player)[item],0,item,s_table.wolf);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",BnSDialogue - 2);
    elseif (SmokeOnTheMountain == QUEST_AVAILABLE) then
        player:startEvent(0x01ac);
    else
        player:startEvent(0x01a5);
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
    if (csid == 0x01ac) then
        player:addQuest(BASTOK,SMOKE_ON_THE_MOUNTAIN);
    elseif (csid == 0x01ad) then
        player:tradeComplete();
        player:addGil(GIL_RATE * 300);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE * 300);
        player:addTitle(HOT_DOG);
            if (player:getQuestStatus(BASTOK,SMOKE_ON_THE_MOUNTAIN) == QUEST_ACCEPTED) then
                player:addFame(BASTOK,30);
                player:completeQuest(BASTOK,SMOKE_ON_THE_MOUNTAIN);
            else
                player:addFame(BASTOK,5);
            end
    elseif (csid == 0x0395 and option == 1) then
        player:setLocalVar("Miledo_Caught",0);
        player:setLocalVar("Luto_Caught",0);
        player:setLocalVar("Bait_and_Switch_Quest_Active",1);
    end
end;

