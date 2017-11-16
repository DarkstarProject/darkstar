-----------------------------------
-- Area: Metalworks
-- NPC:  Medium Switch
-- Involved in quest: Bait and Switch
-- !pos -31.176 -1.000 0.043 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/baitandswitch");
require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local active = player:getLocalVar("Bait_and_Switch_Quest_Active");
    local item = CheckOptionForItem(player);
printf ("Large Switch - item = %u",item);
    local increment = player:getLocalVar("CS_Progression_Increment");
printf ("Large Switch - increment = %u",increment);
    local s_table = Switch_Table[player:getLocalVar("Bait_and_Switch_Quest_Order")];
printf ("Large Switch - order = %u",player:getLocalVar("Bait_and_Switch_Quest_Order"));
    local checkSwitch = player:getLocalVar("Switch_Table_Current");
printf ("Large Switch - checkSwitch = %u",checkSwitch);
    local paramEight = 0;
printf ("Large Switch - Lead Guardsman = %u",player:getLocalVar("Lead_Guardsman"));
        if (item == 5) then
            if (player:getLocalVar("Lead_Guardsman") == BnS_KILN) then
                if (s_table.ord[checkSwitch] == 3) then
                    paramEight = 1;
                else
                    paramEight = 4;
                end
            end
        elseif (item == 4) then
            if (CheckSnares(player)[7] <= 3) then
                if (CheckSnares(player)[1] == 1) then
                    paramEight = 1;
                end
            elseif (CheckSnares(player)[7] > 3) then
                if (CheckSnares(player)[1] == 1) then
                    paramEight = 4;
                end
            end
        end
    local CSProgression = CheckBaitProgress(player)[item] + increment;
printf ("Large Switch - CS Progression = %u",CSProgression);
        if (CSProgression > 3) then
            CSProgression = 0;
        end
    local caughtParam = 0;
    local caught = player:getLocalVar("Bait_and_Switch_Caught");
printf ("Large Switch - caught = %u",caught);
        if (caught == 2) then
            caughtParam = 1;
        end
    local sheknowsmyname = 0;
        if (player:getQuestStatus(NATION_BASTOK,BAIT_AND_SWITCH) == QUEST_COMPLETED or
            player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_COMPLETED) then
                sheknowsmyname = 1;
        end
    local timeCheck = player:getLocalVar("Bait_and_Switch_Time_Limit");

    if (os.time() > timeCheck and item == 6) then
        player:messageSpecial(BAIT_AND_SWITCH_BASE - 380);
        player:resetLocalVars();
    elseif (active == 1) then
        player:startEvent(0x038e,0,caughtParam,item,0,0,CSProgression,sheknowsmyname,paramEight);
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
     printf("CSID: %u",csid);
     printf("RESULT: %u",option);
    local s_table = Switch_Table[player:getLocalVar("Bait_and_Switch_Quest_Order")];
    local checkSwitch = player:getLocalVar("Switch_Table_Current");
    local increment = player:getLocalVar("CS_Progression_Increment");
    local item = CheckOptionForItem(player);
    local caught = player:getLocalVar("Bait_and_Switch_Caught");

    if (csid == 0x038e) then
        if (option == 130 or option == 258 or option == 514 or 
            option == 1154 or option == 1282 or option == 1538) then
                player:setLocalVar("CS_Progression_Increment",increment + 1);
                    if (item == 2) then
                        player:addGil(GIL_RATE * 10);
                    end
                    if (s_table.ord[checkSwitch] == 3) then
                        player:messageSpecial(DeliverMessage(player));
                        player:setLocalVar("Switch_Table_Current",checkSwitch + 1);
                    else
                        player:setLocalVar("Switch_Table_Current",1);
                    end
        elseif (option == 2) then
            if (s_table.ord[checkSwitch] == 3) then
                player:messageSpecial(DeliverMessage(player));
                player:setLocalVar("Switch_Table_Current",checkSwitch + 1);
            else
                player:setLocalVar("Switch_Table_Current",1);
            end
        elseif (option == 18 or option == 146 or option == 274 or option == 530) then
            player:setLocalVar("CS_Progression_Increment",increment + 1);
            player:setLocalVar("Lead_Guardsman",BnS_KILN);
            if (s_table.ord[checkSwitch] == 3) then
                player:messageSpecial(DeliverMessage(player));
                player:setLocalVar("Switch_Table_Current",checkSwitch + 1);
            else
                player:setLocalVar("Switch_Table_Current",1);
            end
        elseif (option == 34 or option == 162 or option == 290 or option == 546) then
            player:setLocalVar("CS_Progression_Increment",increment + 1);
            player:setLocalVar("Lead_Guardsman",BnS_REFINERY);
            if (s_table.ord[checkSwitch] == 3) then
                player:messageSpecial(DeliverMessage(player));
                player:setLocalVar("Switch_Table_Current",checkSwitch + 1);
            else
                player:setLocalVar("Switch_Table_Current",1);
            end
        elseif (option == 66 or option == 194 or option == 322 or option == 578) then
            player:setLocalVar("CS_Progression_Increment",increment + 1);
            player:setLocalVar("Lead_Guardsman",BnS_REPLICA);
            if (s_table.ord[checkSwitch] == 3) then
                player:messageSpecial(DeliverMessage(player));
                player:setLocalVar("Switch_Table_Current",checkSwitch + 1);
            else
                player:setLocalVar("Switch_Table_Current",1);
            end
        elseif (option == 4) then
            if (caught == 2) then
                player:resetLocalVars();
            else
                player:setLocalVar("Bait_and_Switch_Caught",caught + 1);
                player:setLocalVar("Miledo_Caught",1);
                player:setLocalVar("Bait_and_Switch_Quest_Active",2);
            end
        elseif (option == 8) then
            if (caught == 2) then
                player:resetLocalVars();
            else
                player:setLocalVar("Bait_and_Switch_Caught",caught + 1);
                player:setLocalVar("Luto_Caught",1);
                player:setLocalVar("Bait_and_Switch_Quest_Active",2);
            end
        end
    end
end;

