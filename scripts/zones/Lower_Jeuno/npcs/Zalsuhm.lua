-----------------------------------
-- Area: Lower Jeuno
-- NPC: Zalsuhm
-- Standard Info NPC
-----------------------------------

require("scripts/globals/equipment");
require("scripts/globals/quests");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

function getQuestId(mainJobId)

    return (UNLOCKING_A_MYTH_WARRIOR - 1 + mainJobId);

end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    --printf("LowerJeuno_Zalsuhm.onTrade() - ");
    
    if (trade:getItemCount() == 1) then
        for i, wepId in pairs(BaseNyzulWeapons) do
            if (trade:hasItemQty(wepId, 1)) then
                local unlockingAMyth = player:getQuestStatus(JEUNO, getQuestId(i))
                --printf("\tUnlockingAMyth" .. i .. " = %u", unlockingAMyth);
                
                if (unlockingAMyth == QUEST_ACCEPTED) then
                    -- TODO: Logic for checking weapons current WS points
                    local wsPoints = 0;
                    --printf("\twsPoints = %u", wsPoints);
                    
                    if (wsPoints >= 0 and wsPoints <= 49) then
                        player:startEvent(10091); -- Lowest Tier Dialog
                    elseif (wsPoints <= 200) then
                        player:startEvent(10092); -- Mid Tier Dialog
                    elseif (wsPoints <= 249) then
                        player:startEvent(10093); -- High Tier Dialog
                    elseif (wsPoints >= 250) then
                        player:startEvent(10088, i); -- Quest Complete!
                    end
                end
                
                return;
            end			
	    end	
    end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    --printf("LowerJeuno_Zalsuhm.onTrigger() - ");
    
    local mainJobId = player:getMainJob();
    
    local unlockingAMyth = player:getQuestStatus(JEUNO, getQuestId(mainJobId))
    --printf("\tUnlockingAMyth" .. mainJobId .. " = %u", unlockingAMyth);
    
    local mainWeaponId = player:getEquipID(SLOT_MAIN);
    --printf("\tmainWeaponId: %u", mainWeaponId);
    	
    local nyzulWeapon = isBaseNyzulWeapon(mainWeaponId);
    --printf("\tIsBaseNyzulWeapon: %s", (nyzulWeapon and "TRUE" or "FALSE"));
    
    if (unlockingAMyth == QUEST_AVAILABLE) then
        local zalsuhmUpset = player:getVar("Upset_Zalsuhm");
        if (player:needToZone() and zalsuhmUpset > 0) then -- Zalsuhm is still angry
            player:startEvent(10090);
        else
            if (zalsuhmUpset > 0) then
                player:setVar("Upset_Zalsuhm", 0);
            end
            
            if (nyzulWeapon) then -- The player has a Nyzul weapon in the mainHand, try to initiate quest
                player:startEvent(10086, mainJobId);
            else
                player:startEvent(10085); -- Default dialog
            end
        end
    elseif (unlockingAMyth == QUEST_ACCEPTED) then -- Quest is active for current job
        player:startEvent(10087); -- Zalsuhm asks for the player to show him the weapon if they sense a change
    else -- Quest is complete for the current job
        player:startEvent(10089);
    end
	
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    
    --printf("LowerJeuno_Zalsuhm.onEventUpdate() - ");
    --printf("\tCSID: %u", csid);
    --printf("\tRESULT: %u", option);
    
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    
    --printf("LowerJeuno_Zalsuhm.onEventFinish() - ");
    --printf("\tCSID: %u", csid);
    --printf("\tRESULT: %u", option);
    
    -- Zalsuhm wants to research the player's Nyzul Weapon
    if (csid == 10086) then	
        -- The player chose "He has shifty eyes" (turns down the quest)
        if (option == 53) then
            player:setVar("Upset_Zalsuhm", 1);
            player:needToZone(true);
        elseif (option <= JOBS["SCH"]) then -- Just to make sure we didn't get into an invalid state
            -- The player chose "More power" (accepts the quest)
            local questId = getQuestId(option);
            player:addQuest(JEUNO, questId);
        end
    elseif (csid == 10088 and option <= JOBS["SCH"]) then -- The quest is completed
        local questId = getQuestId(option);
        player:completeQuest(JEUNO, questId);
    end
    
end;
