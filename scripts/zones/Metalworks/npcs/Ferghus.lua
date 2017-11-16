-----------------------------------
-- Area: Metalworks
-- NPC: Ferghus
-- Starts Quest: Too Many Chefs (1,86)
-- Involved in quest: Bait and Switch
-- !pos -23.092 -10.000 -27.157 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/status");
require("scripts/globals/quests");
require("scripts/globals/baitandswitch");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local TooManyChefs = player:getQuestStatus(BASTOK,TOO_MANY_CHEFS);
    local pFame = player:getFameLevel(BASTOK);
    local item = CheckOptionForItem(player);
    local BnSDialogue = player:getLocalVar("Bait_and_Switch_Quest_NPCs");
    local active = player:getLocalVar("Bait_and_Switch_Quest_Active");
    local timesUP = false;
    if (os.time() > player:getLocalVar("Bait_and_Switch_Time_Limit") and item == 6) then
        timesUP = true;
    end

    if (active == 2 and timesUP == false) then
        player:startEvent(0x039b,0,0,item);
    elseif (player:getMaskBit(BnSDialogue,2) == true and active == 1 and timesUP == false) then
        player:startEvent(0x0391,0,0,item);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",BnSDialogue - 4);
    elseif (TooManyChefs == QUEST_AVAILABLE and pFame >= 5) then
        player:startEvent(0x03b2); -- Start Quest "Too Many Chefs"
    elseif (player:getVar("TOO_MANY_CHEFS") == 4) then -- after trade to Leonhardt
        player:startEvent(0x03b3);
    else
        player:startEvent(0x01A4); -- Standard
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

    if (csid == 0x03b2 and option == 0) then
        player:addQuest(BASTOK,TOO_MANY_CHEFS);
        player:setVar("TOO_MANY_CHEFS",1);
    elseif (csid == 0x03b3) then
        player:setVar("TOO_MANY_CHEFS",5);
    elseif (csid == 0x039b) then
        if (CheckOptionForItem(player) == 7 and option == 1) then
            player:setLocalVar("Bait_and_Switch_Quest_Active",3);
        elseif (CheckOptionForItem(player) ~= 7 and option == 0) then
            player:setLocalVar("Bait_and_Switch_Quest_Active",3);
        end
    end
end;
