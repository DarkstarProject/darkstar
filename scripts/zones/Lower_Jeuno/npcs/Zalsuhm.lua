-----------------------------------
-- Area: Lower Jeuno
--  NPC: Zalsuhm
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/equipment")
require("scripts/globals/quests")
require("scripts/globals/status")
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
            [dsp.job.WAR] = 24,
            [dsp.job.MNK] = 15,
            [dsp.job.WHM] = 29,
            [dsp.job.BLM] = 30,
            [dsp.job.RDM] = 20,
            [dsp.job.THF] = 17,
            [dsp.job.PLD] = 21,
            [dsp.job.DRK] = 25,
            [dsp.job.BST] = 23,
            [dsp.job.BRD] = 18,
            [dsp.job.RNG] = 33,
            [dsp.job.SAM] = 28,
            [dsp.job.NIN] = 27,
            [dsp.job.DRG] = 26,
            [dsp.job.SMN] = 31,
            [dsp.job.BLU] = 22,
            [dsp.job.COR] = 34,
            [dsp.job.PUP] = 16,
            [dsp.job.DNC] = 19,
            [dsp.job.SCH] = 32,
        }
        local skill = jobs[option]
        
        player:completeQuest(JEUNO, questId)
        player:messageSpecial(ID.text.MYTHIC_LEARNED, player:getMainJob())
        player:addLearnedWeaponskill(skill)
    end
end