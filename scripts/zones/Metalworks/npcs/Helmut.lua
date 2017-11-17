-----------------------------------
-- Area: Metalworks
-- NPC:  Helmut
-- Involved in quest: Bait and Switch
-- !pos -70.334 1.999 -5.143 237
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
    local active = player:getLocalVar("Bait_and_Switch_Quest_Active");

    if (active == 7) then
        player:startEvent(0x0393);
    elseif (player:getMaskBit(BnSDialogue,7) == true and item ~= 1 and checkTimeUP(player) == false and active == 1) then
        player:startEvent(0x0388,0,0,item,s_table.helmut);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",BnSDialogue - 128);
    else
        player:startEvent(0x019A);
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

    if (csid == 0x0393) then
        if (option == 1) then
            player:setLocalVar("Bait_and_Switch_Quest_Active",8);
        elseif (option == 2) then
            player:setLocalVar("Bait_and_Switch_Quest_Active",9);
        elseif (option == 3) then
            player:setLocalVar("Bait_and_Switch_Quest_Active",10);
        end
    end
end;

