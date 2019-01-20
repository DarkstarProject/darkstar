-----------------------------------
-- Area: Lower Jeuno
--  NPC: Zalsuhm
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/equipment")
require("scripts/globals/quests")
-----------------------------------

function getQuestId(mainJobId)

    return (UNLOCKING_A_MYTH_WARRIOR - 1 + mainJobId)

end

function onTrade(player,npc,trade)
    if (trade:getItemCount() == 1) then
        for i, wepId in pairs(BaseNyzulWeapons) do
            if trade:hasItemQty(wepId, 1) then
                local unlockingAMyth = player:getQuestStatus(JEUNO, getQuestId(i))
                if (unlockingAMyth == QUEST_ACCEPTED) then
                    local wsPoints = trade:getItem(0):getWeaponskillPoints()
                    if wsPoints >= 0 and wsPoints <= 49 then
                        player:startEvent(10091)
                    elseif wsPoints <= 200 then
                        player:startEvent(10092)
                    elseif wsPoints <= 249 then
                        player:startEvent(10093)
                    elseif wsPoints >= 250 then
                        player:startEvent(10088, i)
                    end
                end

                return
            end
        end
    end

end

function onTrigger(player,npc)
    local mainJobId = player:getMainJob()
    local unlockingAMyth = player:getQuestStatus(JEUNO, getQuestId(mainJobId))
    local nyzulWeapon = isBaseNyzulWeapon(player:getEquipID(dsp.slot.MAIN))

    if unlockingAMyth == QUEST_AVAILABLE then
        if player:needToZone() and player:getVar("Upset_Zalsuhm") > 0 then
            player:startEvent(10090)
        else
            if player:getVar("Upset_Zalsuhm") > 0 then
                player:setVar("Upset_Zalsuhm", 0)
            end

            if nyzulWeapon then
                player:startEvent(10086, mainJobId)
            else
                player:startEvent(10085)
            end
        end
    elseif unlockingAMyth == QUEST_ACCEPTED then
        player:startEvent(10087)
    else
        player:startEvent(10089)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    local questId = getQuestId(option)
    if csid == 10086 then
        if option == 53 then
            player:setVar("Upset_Zalsuhm", 1)
            player:needToZone(true)
        elseif option <= dsp.job.SCH then
            player:addQuest(JEUNO, questId)
        end
    elseif csid == 10088 and option <= dsp.job.SCH then
        local jobs = 
        {
            [1]  = 24,
            [2]  = 15,
            [3]  = 29,
            [4]  = 30,
            [5]  = 20,
            [6]  = 17,
            [7]  = 21,
            [8]  = 25,
            [9]  = 23,
            [10] = 18,
            [11] = 33,
            [12] = 28,
            [13] = 27,
            [14] = 26,
            [15] = 31,
            [16] = 22,
            [17] = 34,
            [18] = 16,
            [19] = 19,
            [20] = 32,
        }
        local skill = jobs[option]
        
        player:completeQuest(JEUNO, questId)
        player:messageSpecial(ID.text.MYTHIC_LEARNED, player:getMainJob())
        player:addLearnedWeaponskill(skill)
    end
end