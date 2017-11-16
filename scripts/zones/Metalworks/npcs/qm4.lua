-----------------------------------
-- Area: Metalworks
-- NPC:  ???
-- Involved in quest: Bait and Switch
-- !pos -22.235 6.847 0.060 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
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
    local BaitandSwitch = player:getQuestStatus(NATION_BASTOK,BAIT_AND_SWITCH);
    local UnlistedQualities = player:getQuestStatus(JEUNO,UNLISTED_QUALITIES);
    local BaitProgress = player:getVar("Bait_and_Switch_Quest_Progress");
    local metLuto = 0;
    local letterWho = 0;
    local canCostume = 0;
    local item = CheckOptionForItem(player);
    if (UnlistedQualities == QUEST_COMPLETED) then
        metLuto = 1;
    end
    if (BaitandSwitch == QUEST_COMPLETED) then
        metLuto = 2;
    end
    if (BaitProgress == 63 and player:hasKeyItem(COSTUME_KIT) == true) then
        letterWho = 2;
        canCostume = 1;
    elseif (BaitProgress == 127) then
        letterWho = 2;
    end
    local check = player:getLocalVar("Bait_and_Switch_Check_qm");
    local active = player:getLocalVar("Bait_and_Switch_Quest_Active");
    local timeCheck = player:getLocalVar("Bait_and_Switch_Time_Limit");

    if (os.time() > timeCheck and item == 6) then
        player:messageSpecial(BAIT_AND_SWITCH_BASE - 380);
        player:resetLocalVars();
    elseif (active == 4) then
        player:startEvent(0x0398,0,0,CheckBaitProgress(player)[item] * item,0,0,0,letterWho);
    elseif (check == 1) then
        player:startEvent(0x038b);
    elseif (active == 1) then
        if (check == 0) then
                player:startEvent(0x0384,0,letterWho,0,0,0,canCostume,metLuto);
                player:setLocalVar("Bait_and_Switch_Check_qm",1);
        end
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

    if (csid == 0x038b and option == 1) then
        player:resetLocalVars();
    elseif (csid == 0x0384) then
        if (option == 1) then
            local tablerandom = math.random(101,106);
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        elseif (option == 2) then
            local tablerandom = math.random(201,210);
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        elseif (option == 3) then
            local tablerandom = math.random(301,310);
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        elseif (option == 4) then
            local tablerandom = math.random(401,410);
            player:setLocalVar("Lead_Guardsman",BnS_KILN);
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        elseif (option == 5) then
            local tablerandom = math.random(401,410);
            player:setLocalVar("Lead_Guardsman",BnS_REFINERY);
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        elseif (option == 6) then
            local tablerandom = math.random(401,410);
            player:setLocalVar("Lead_Guardsman",BnS_REPLICA);
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        elseif (option == 7)then
            local tablerandom = math.random(401,410);
            player:setLocalVar("Bait_and_Switch_Time_Limit",os.time() + 3600);  -- 1 hour to complete
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        elseif (option == 0 or option >= 512) then
            local tablerandom = math.random(401,410);
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        elseif (option == 8) then
            local tablerandom = math.random(501,510);
            player:setLocalVar("Bait_and_Switch_Quest_Order",tablerandom);
            player:setLocalVar("Bait_and_Switch_Quest_Option",option);
        end
        player:setLocalVar("Switch_Table_Current",1);
        player:setLocalVar("Bait_and_Switch_Quest_NPCs",511);
    elseif (csid == 0x0398) then
        if (player:getFreeSlotsCount() > 0) then
            player:addItem(AwardPrize(player),1);
            player:messageSpecial(ITEM_OBTAINED,AwardPrize(player));
            RecordBaitProgress(player);
            if (player:getQuestStatus(NATION_BASTOK,BAIT_AND_SWITCH) == QUEST_ACCEPTED) then
                player:addFame(BASTOK,30);
                player:completeQuest(NATION_BASTOK,BAIT_AND_SWITCH);
            else
                player:addFame(BASTOK,5);
            end
            if (item == 7 and player:hasKeyItem(COSTUME_KIT) == true) then
                player:delKeyItem(COSTUME_KIT);
            end
            player:setVar("Bait_and_Switch_Conquest_Tally",getConquestTally());
            player:resetLocalVars();
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,AwardPrize(player));
        end
    end
end;

