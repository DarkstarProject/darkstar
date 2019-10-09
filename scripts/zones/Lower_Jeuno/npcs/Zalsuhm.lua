-----------------------------------
-- Area: Lower Jeuno
--  NPC: Zalsuhm
-- Standard Info NPC
-----------------------------------
local ID = require("scripts/zones/Lower_Jeuno/IDs")
require("scripts/globals/equipment")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/status")
require("scripts/globals/weaponskillids")
-----------------------------------

function getQuestId(mainJobId)

    return dsp.quest.jeuno.UNLOCKING_A_MYTH_WARRIOR - 1 + mainJobId

end

function onTrade(player,npc,trade)
    for i, wepId in pairs(BaseNyzulWeapons) do
        if npcUtil.tradeHasExactly(trade, wepId) then
            local unlockingAMyth = player:getQuestStatus(JEUNO, getQuestId(i))
            if unlockingAMyth == QUEST_ACCEPTED then
                local wsPoints = trade:getItem(0):getWeaponskillPoints()
                if wsPoints <= 49 then
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

function onTrigger(player,npc)
    local mainJobId = player:getMainJob()
    local unlockingAMyth = player:getQuestStatus(JEUNO, getQuestId(mainJobId))
    local nyzulWeaponMain = isBaseNyzulWeapon(player:getEquipID(dsp.slot.MAIN))
    local nyzulWeaponRanged = isBaseNyzulWeapon(player:getEquipID(dsp.slot.RANGED))

    if unlockingAMyth == QUEST_AVAILABLE then
        if player:needToZone() and player:getCharVar("Upset_Zalsuhm") > 0 then
            player:startEvent(10090)
        else
            if player:getCharVar("Upset_Zalsuhm") > 0 then
                player:setCharVar("Upset_Zalsuhm", 0)
            end

            if nyzulWeaponMain or nyzulWeaponRanged then
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
            player:setCharVar("Upset_Zalsuhm", 1)
            player:needToZone(true)
        elseif option <= dsp.job.SCH then
            player:addQuest(JEUNO, questId)
        end
    elseif csid == 10088 and option <= dsp.job.SCH then
        local jobs = 
        {
            [dsp.job.WAR] = dsp.ws_unlock.KINGS_JUSTICE,
            [dsp.job.MNK] = dsp.ws_unlock.ASCETICS_FURY,
            [dsp.job.WHM] = dsp.ws_unlock.MYSTIC_BOON,
            [dsp.job.BLM] = dsp.ws_unlock.VIDOHUNIR,
            [dsp.job.RDM] = dsp.ws_unlock.DEATH_BLOSSOM,
            [dsp.job.THF] = dsp.ws_unlock.MANDALIC_STAB,
            [dsp.job.PLD] = dsp.ws_unlock.ATONEMENT,
            [dsp.job.DRK] = dsp.ws_unlock.INSURGENCY,
            [dsp.job.BST] = dsp.ws_unlock.PRIMAL_REND,
            [dsp.job.BRD] = dsp.ws_unlock.MORDANT_RIME,
            [dsp.job.RNG] = dsp.ws_unlock.TRUEFLIGHT,
            [dsp.job.SAM] = dsp.ws_unlock.TACHI_RANA,
            [dsp.job.NIN] = dsp.ws_unlock.BLADE_KAMU,
            [dsp.job.DRG] = dsp.ws_unlock.DRAKESBANE,
            [dsp.job.SMN] = dsp.ws_unlock.GARLAND_OF_BLISS,
            [dsp.job.BLU] = dsp.ws_unlock.EXPIACION,
            [dsp.job.COR] = dsp.ws_unlock.LEADEN_SALUTE,
            [dsp.job.PUP] = dsp.ws_unlock.STRINGING_PUMMEL,
            [dsp.job.DNC] = dsp.ws_unlock.PYRRHIC_KLEOS,
            [dsp.job.SCH] = dsp.ws_unlock.OMNISCIENCE,
        }
        local skill = jobs[option]
        
        player:completeQuest(JEUNO, questId)
        player:messageSpecial(ID.text.MYTHIC_LEARNED, player:getMainJob())
        player:addLearnedWeaponskill(skill)
    end
end