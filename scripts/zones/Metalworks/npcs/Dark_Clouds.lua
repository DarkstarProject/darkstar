-----------------------------------
-- Area: Metalworks
-- NPC:  Dark Clouds
-- Involved in quest: Bait and Switch
-- !pos -85.442 2.000 -3.592 237
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
    local item = CheckOptionForItem(player);
    local BnSDialogue = player:getLocalVar("Bait_and_Switch_Quest_NPCs");

    if (player:getMaskBit(BnSDialogue,4) == true and item == 1 and checkTimeUP(player) == false) then
        player:startEvent(0x039a);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",BnSDialogue - 16);
    else
        player:startEvent(0x0064);
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

    if (csid == 0x039a and option == 1) then
        player:setLocalVar("Bait_and_Switch_Caught",player:getLocalVar("Bait_and_Switch_Caught") + 1);
        player:setLocalVar("Luto_Caught",1);
        player:setLocalVar("Bait_and_Switch_Quest_Active",2);
    end
end;

