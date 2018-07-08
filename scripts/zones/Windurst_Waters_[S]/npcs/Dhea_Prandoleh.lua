-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Dhea Prandoleh
-- Type: Standard NPC
-- !pos 1 -1 15 94
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Windurst_Waters_[S]/TextIDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local tigressStirs = player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS)
    local tigressStrikes = player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES)

    if player:getCampaignAllegiance() > 0 and tigressStirs == QUEST_AVAILABLE then
        player:startEvent(128)
    elseif tigressStirs == QUEST_ACCEPTED then
        player:startEvent(160)
    elseif tigressStirs == QUEST_COMPLETED and tigressStrikes == QUEST_AVAILABLE then
        player:startEvent(135)
    elseif tigressStrikes == QUEST_ACCEPTED then
        if player:getVar("TigressStrikesProg") < 3 then
            player:startEvent(131)
        elseif player:getVar("TigressStrikesProg") == 3 then
            player:startEvent(134)
        end
    else
        player:startEvent(136)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 128 then
        player:addQuest(CRYSTAL_WAR, THE_TIGRESS_STIRS)
    elseif csid == 133 then
        player:addQuest(CRYSTAL_WAR, THE_TIGRESS_STRIKES)
    elseif csid == 134 and npcUtil.completeQuest(player, CRYSTAL_WAR, THE_TIGRESS_STRIKES, {item=139, title=dsp.title.AJIDOMARUJIDOS_MINDER}) then
        player:needToZone(true)
    end
end