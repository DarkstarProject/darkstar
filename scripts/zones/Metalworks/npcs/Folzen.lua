-----------------------------------
-- Area: Metalworks
-- NPC:  Folzen
-- Involved in quest: Bait and Switch
-- !pos -92.114 2.000 8.530 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
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
    local BnSDialogue = player:getLocalVar("Bait_and_Switch_Quest_NPCs");
    local active = player:getLocalVar("Bait_and_Switch_Quest_Active");
    local item = CheckOptionForItem(player);
    local luto = (player:getLocalVar("Luto_Caught"));
    local miledo = (player:getLocalVar("Miledo_Caught"));
    local keyParam = 0;
    if (luto == 1) then
        keyParam = 2;
    elseif (miledo == 1) then
        keyParam = 3;
    end

    if (active == 3 and checkTimeUP(player) == false) then
        if (item == 7) then
            player:startEvent(0x0392);
        else
            player:startEvent(0x0394,0,0,item,0,0,0,keyParam,0);
        end
    elseif (player:getMaskBit(BnSDialogue,5) == true and active == 1 and checkTimeUP(player) == false) then
        player:startEvent(0x0386,CheckBaitProgress(player)[item],0,item,0,0,0,0,0);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",BnSDialogue - 32);
    else
        player:startEvent(0x019B);
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

    if (csid == 0x0394) then
        player:setLocalVar("Miledo_Caught",0);
        player:setLocalVar("Luto_Caught",0);
        player:setLocalVar("Bait_and_Switch_Quest_Active",1);
    elseif (csid == 0x0392 and option == 1) then
        player:setLocalVar("Bait_and_Switch_Quest_Active",7);
    end
end;

