-----------------------------------
-- Area: Mount_Zhayolm
--  NPC: Waudeen
-- Type: Assault
-- !pos 673.882 -23.995 367.604 61
-----------------------------------
local ID = require("scripts/zones/Mount_Zhayolm/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    local toauMission = player:getCurrentMission(TOAU)
    local beginnings = player:getQuestStatus(AHT_URHGAN, dsp.quest.id.ahtUrhgan.BEGINNINGS)

    -- IMMORTAL SENTRIES
    if toauMission == dsp.mission.id.toau.IMMORTAL_SENTRIES then
        if player:hasKeyItem(dsp.ki.SUPPLIES_PACKAGE) then
            player:startEvent(4)
        elseif player:getCharVar("AhtUrganStatus") == 1 then
            player:startEvent(5)
        end

    -- BEGINNINGS
    elseif beginnings == QUEST_ACCEPTED then
        if not player:hasKeyItem(dsp.ki.BRAND_OF_THE_FLAMESERPENT) then
            player:startEvent(10) -- brands you
        else
            player:startEvent(11) -- the way is neither smooth nor easy
        end

    -- ASSAULT
    elseif toauMission >= dsp.mission.id.toau.PRESIDENT_SALAHEEM then
        local IPpoint = player:getCurrency("imperial_standing")
        if player:hasKeyItem(dsp.ki.LEBROS_ASSAULT_ORDERS) and not player:hasKeyItem(dsp.ki.ASSAULT_ARMBAND) then
            player:startEvent(209, 50, IPpoint)
        else
            player:startEvent(6)
            -- player:delKeyItem(dsp.ki.ASSAULT_ARMBAND)
        end

    -- DEFAULT DIALOG
    else
        player:startEvent(3)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    -- IMMORTAL SENTRIES
    if csid == 4 and option == 1 then
        player:delKeyItem(dsp.ki.SUPPLIES_PACKAGE)
        player:setCharVar("AhtUrganStatus", 1)

    -- BEGINNINGS
    elseif csid == 10 then
        player:addKeyItem(dsp.ki.BRAND_OF_THE_FLAMESERPENT)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.BRAND_OF_THE_FLAMESERPENT)

    -- ASSAULT
    elseif csid == 209 and option == 1 then
        player:delCurrency("imperial_standing", 50)
        player:addKeyItem(dsp.ki.ASSAULT_ARMBAND)
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.ASSAULT_ARMBAND)
    end
end
