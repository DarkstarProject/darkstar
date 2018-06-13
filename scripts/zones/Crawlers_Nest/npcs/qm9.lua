-----------------------------------
-- Area: Crawlers Nest
--  NPC: ???
-- Used In Quest: A Boy's Dream
-- !pos -18 -8 124 197
-----------------------------------
package.loaded["scripts/zones/Crawlers_Nest/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Crawlers_Nest/TextIDs")
require("scripts/zones/Crawlers_Nest/MobIDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getQuestStatus(SANDORIA, A_BOY_S_DREAM) == QUEST_ACCEPTED and VanadielDayOfTheYear() ~= player:getVar("DreadbugNM_Day") then
        if os.time() > player:getVar("DreadbugNM_Timer") + 30 and npcUtil.popFromQM(player, npc, DREADBUG, true, false) then
            player:messageSpecial(SENSE_OF_FOREBODING)
            player:setVar("DreadbugNM_Timer", os.time() + 180)
            player:setVar("DreadbugNM_Day", VanadielDayOfTheYear())
        else
            player:messageSpecial(NOTHING_SEEMS_TO_HAPPEN)
        end
    else
        player:messageSpecial(NOTHING_WILL_HAPPEN_YET)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end