-----------------------------------
-- Area: Metalworks
-- NPC:  Striking Snake
-- Involved in quest: Bait and Switch
-- !pos -15.700 -9.244 19.658 237
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
    local s_table = Switch_Table[player:getLocalVar("Bait_and_Switch_Quest_Order")];
    local item = CheckOptionForItem(player);
    local BnSDialogue = player:getLocalVar("Bait_and_Switch_Quest_NPCs");
    local timesUP = false;
    local active = player:getLocalVar("Bait_and_Switch_Quest_Active");
    local luto = (player:getLocalVar("Luto_Caught"));
    local miledo = (player:getLocalVar("Miledo_Caught"));
    local keyParam = 0;
        if (luto == 1) then
            keyParam = 2;
        elseif (miledo == 1) then
            keyParam = 1;
        end
    if (os.time() > player:getLocalVar("Bait_and_Switch_Time_Limit") and item == 6) then
        timesUP = true;
    end

    if (active == 10) then
        player:startEvent(0x0397,0,keyParam);
    elseif (player:getMaskBit(BnSDialogue,0) == true and timesUP == false and active == 1) then
        player:startEvent(0x0387,CheckBaitProgress(player)[item],0,item,s_table.snake);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",BnSDialogue - 1);
    else
        player:startEvent(0x0099);
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

    if (csid == 0x0397 and option == 1) then
        player:setLocalVar("Miledo_Caught",0);
        player:setLocalVar("Luto_Caught",0);
        player:setLocalVar("Bait_and_Switch_Quest_Active",1);
    end
end;

