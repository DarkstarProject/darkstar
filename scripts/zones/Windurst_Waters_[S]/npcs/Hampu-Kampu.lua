-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Hampu-Kampu
-- Type: Quest NPC
-----------------------------------
local ID = require("scripts/zones/Windurst_Waters_[S]/IDs")
require("scripts/globals/quests");
require("scripts/globals/keyitems");


function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local sayItWithAHandbag = player:getQuestStatus(CRYSTAL_WAR, dsp.quest.id.crystalWar.SAY_IT_WITH_A_HANDBAG)
    local sayItWithAHandbagCS = player:getVar("sayItWithAHandbagCS")

    if (sayItWithAHandbag == QUEST_COMPLETED) then
        player:startEvent(175)
    elseif (player:hasKeyItem(dsp.ki.REPAIRED_HANDBAG) and sayItWithAHandbagCS == 4) then
        player:startEvent(174)
        print("repaired bag and 4")
    elseif (player:hasKeyItem(dsp.ki.TORN_PATCHES_OF_LEATHER) or sayItWithAHandbagCS == 3) then
        player:startEvent(173)
        print(player:hasKeyItem(dsp.ki.REPAIRED_HANDBAG))
    elseif (sayItWithAHandbag == QUEST_ACCEPTED and sayItWithAHandbagCS == 1) then
        player:startEvent(172)
    elseif (sayItWithAHandbag == QUEST_ACCEPTED) then
        player:startEvent(170)
    elseif (sayItWithAHandbag == QUEST_AVAILABLE) then
        player:startEvent(169)
        player:setVar("sayItWithAHandbagCS",0)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if (csid == 174) then -- Option doesn't matter as NPC will take key item if yes or no
        if (player:getFreeSlotsCount() < 1) then
            player:messageSpecial(ID.text.ITEM_CANNOT_BE_OBTAINED,19110);
        else
            player:delKeyItem(dsp.ki.REPAIRED_HANDBAG)
            player:addItem(19110)
            player:completeQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.SAY_IT_WITH_A_HANDBAG)
            player:messageSpecial(ID.text.ITEM_OBTAINED, 19110)
        end
    elseif (csid == 172) then
            player:giveKeyItem(dsp.ki.TORN_PATCHES_OF_LEATHER)
    elseif (csid == 169) then
        player:addQuest(CRYSTAL_WAR, dsp.quest.id.crystalWar.SAY_IT_WITH_A_HANDBAG)
    end
end 