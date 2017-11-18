-----------------------------------
-- Area: Metalworks
-- NPC:  Darha
-- Involved in quest: Bait and Switch
-- !pos -77.922 2.000 21.201 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/baitandswitch");
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
    local s_table = Switch_Table[player:getLocalVar("Bait_and_Switch_Quest_Order")];
    local item = CheckOptionForItem(player);
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

    if (active == 9) then
        player:startEvent(0x0396,0,keyParam);
    elseif (player:getMaskBit(BnSDialogue,6) == true and checkTimeUP(player) == false and active == 1) then
        player:startEvent(0x038a,CheckBaitProgress(player)[item],0,item,s_table.darha);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",BnSDialogue - 64);
    else
        player:startEvent(0x0227);
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

    if (csid == 0x0396 and option == 1) then
        player:setLocalVar("Miledo_Caught",0);
        player:setLocalVar("Luto_Caught",0);
        player:setLocalVar("Bait_and_Switch_Quest_Active",1);
    end
end;

