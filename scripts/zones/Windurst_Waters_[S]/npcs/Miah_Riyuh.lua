-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Miah Riyuh
-- !pos 5.323 -2 37.462 94
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Windurst_Waters_[S]/TextIDs")
require("scripts/globals/keyitems")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local Allegiance = player:getCampaignAllegiance()
    -- 0 = none, 1 = San d'Oria Iron Rams, 2 = Bastok Fighting Fourth, 3 = Windurst Cobras

    local TheFightingFourth = player:getQuestStatus(CRYSTAL_WAR, THE_FIGHTING_FOURTH)
    local SnakeOnThePlains = player:getQuestStatus(CRYSTAL_WAR, SNAKE_ON_THE_PLAINS)
    local SteamedRams = player:getQuestStatus(CRYSTAL_WAR, STEAMED_RAMS)
    local GreenLetter = player:hasKeyItem(dsp.ki.GREEN_RECOMMENDATION_LETTER)

    if SteamedRams == QUEST_ACCEPTED or TheFightingFourth == QUEST_ACCEPTED then
        player:startEvent(122)
    elseif SnakeOnThePlains == QUEST_AVAILABLE and GreenLetter then
        player:startEvent(103)
    elseif SnakeOnThePlains == QUEST_AVAILABLE and player:getVar("GREEN_R_LETTER_USED") == 1 then
        player:startEvent(105)
    elseif SnakeOnThePlains == QUEST_ACCEPTED and player:isMaskFull(player:getVar("SEALED_DOORS"), 3) then
        player:startEvent(106)
    elseif SnakeOnThePlains == QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY) then
        local PuttyUsed = 0
        if player:getMaskBit(player:getVar("SEALED_DOORS"), 0) then
            PuttyUsed = PuttyUsed +1
        end
        if player:getMaskBit(player:getVar("SEALED_DOORS"), 1) then
            PuttyUsed = PuttyUsed +1
        end
        if player:getMaskBit(player:getVar("SEALED_DOORS"), 2) then
            PuttyUsed = PuttyUsed +1
        end
        player:startEvent(104, 0, 0, 0, 0, 0, 0, 0, PuttyUsed)
    elseif SnakeOnThePlains == QUEST_COMPLETED and Allegiance == 3 then
        player:startEvent(107)
    else
        player:startEvent(121)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 103 and option == 0 then
        player:addQuest(CRYSTAL_WAR, SNAKE_ON_THE_PLAINS)
        player:setVar("GREEN_R_LETTER_USED", 1)
        player:delKeyItem(dsp.ki.GREEN_RECOMMENDATION_LETTER)
        npcUtil.giveKeyItem(player, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
    elseif csid == 103 and option == 1 then
        player:setVar("GREEN_R_LETTER_USED", 1)
        player:delKeyItem(dsp.ki.GREEN_RECOMMENDATION_LETTER)
    elseif csid == 104 and option == 1 then
        player:delQuest(CRYSTAL_WAR, SNAKE_ON_THE_PLAINS)
        player:delKeyItem(dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
        player:setVar("SEALED_DOORS", 0)
    elseif csid == 105 and option == 0 then
        player:addQuest(CRYSTAL_WAR, SNAKE_ON_THE_PLAINS)
        player:setVar("GREEN_R_LETTER_USED", 1)
        player:delKeyItem(dsp.ki.GREEN_RECOMMENDATION_LETTER)
        npcUtil.giveKeyItem(player, dsp.ki.ZONPAZIPPAS_ALLPURPOSE_PUTTY)
    elseif csid == 106 and option == 0 then
        -- Is first join, so add Sprinter's Shoes and bronze medal
        if player:getVar("Campaign_Nation") == 0 then
            if npcUtil.completeQuest(player, CRYSTAL_WAR, SNAKE_ON_THE_PLAINS,
                {item=15754, keyItem=dsp.ki.BRONZE_RIBBON_OF_SERVICE, title=dsp.title.COBRA_UNIT_MERCENARY, var={"GREEN_R_LETTER_USED", "SEALED_DOORS"}}
            ) then
                player:setCampaignAllegiance(3)
            end
        else
            npcUtil.completeQuest(player, CRYSTAL_WAR, SNAKE_ON_THE_PLAINS, {title=dsp.title.COBRA_UNIT_MERCENARY, var={"GREEN_R_LETTER_USED", "SEALED_DOORS"}})
            player:setCampaignAllegiance(3)
        end
    end
end