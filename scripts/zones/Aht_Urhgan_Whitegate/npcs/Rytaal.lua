-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Rytaal
-- Type: Standard NPC
-- !pos 112.002 -1.338 -45.038 50
-----------------------------------
local ID = require("scripts/zones/Aht_Urhgan_Whitegate/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/besieged")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)

    local currentday = tonumber(os.date("%j"))
    local lastIDtag = player:getCharVar("LAST_IMPERIAL_TAG")
    local tagCount = player:getCurrency("id_tags")
    local diffday = currentday - lastIDtag
    local currentAssault = player:getCurrentAssault()
    local haveimperialIDtag

    if player:getCurrentMission(TOAU) == dsp.mission.id.toau.PRESIDENT_SALAHEEM and player:getCharVar("AhtUrganStatus") == 0 then
        player:startEvent(269,0,0,0,0,0,0,0,0,0)
    elseif player:getCurrentMission(TOAU) <= dsp.mission.id.toau.IMMORTAL_SENTRIES or player:getMainLvl() <= 49 then
        player:startEvent(270)
    elseif currentAssault ~= 0 and dsp.besieged.hasAssaultOrders(player) == 0 then
        if player:getCharVar("AssaultComplete") == 1 then
            player:messageText(player,ID.text.RYTAAL_MISSION_COMPLETE)
            player:completeAssault(currentAssault)
        else
            player:messageText(player,ID.text.RYTAAL_MISSION_FAILED)
            player:addAssault(0)
        end
        player:setCharVar("AssaultComplete",0)
    elseif player:getCurrentMission(TOAU) > dsp.mission.id.toau.PRESIDENT_SALAHEEM or (player:getCurrentMission(TOAU) == dsp.mission.id.toau.PRESIDENT_SALAHEEM and player:getCharVar("AhtUrganStatus") >= 1) then
        if lastIDtag == 0 then -- first time you get the tag
            tagCount = 1
            player:setCurrency("id_tags", tagCount)
            player:setCharVar("LAST_IMPERIAL_TAG",currentday)
        elseif diffday > 0 then
            tagCount = tagCount + diffday
            if tagCount > 3 then -- store 3 TAG max
                tagCount = 3
            end
            player:setCurrency("id_tags", tagCount)
            player:setCharVar("LAST_IMPERIAL_TAG",currentday)
        end

        if player:hasKeyItem(dsp.ki.IMPERIAL_ARMY_ID_TAG) then
            haveimperialIDtag = 1
        else
            haveimperialIDtag = 0
        end
        player:startEvent(268,dsp.ki.IMPERIAL_ARMY_ID_TAG,tagCount,currentAssault,haveimperialIDtag)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)

    local tagCount = player:getCurrency("id_tags")
    local currentAssault = player:getCurrentAssault()

    if csid == 269 then
        player:setCharVar("AhtUrganStatus",1)
    elseif csid == 268 and option == 1 and player:hasKeyItem(dsp.ki.IMPERIAL_ARMY_ID_TAG) == false and tagCount > 0 then
        npcUtil.giveKeyItem(player, dsp.ki.IMPERIAL_ARMY_ID_TAG)
        player:setCurrency("id_tags", tagCount - 1)
    elseif csid == 268 and option == 2 and player:hasKeyItem(dsp.ki.IMPERIAL_ARMY_ID_TAG) == false and dsp.besieged.hasAssaultOrders(player) ~= 0 then
        if player:hasKeyItem(dsp.ki.LEUJAOAM_ASSAULT_ORDERS) then
            player:delKeyItem(dsp.ki.LEUJAOAM_ASSAULT_ORDERS)
        elseif player:hasKeyItem(dsp.ki.MAMOOL_JA_ASSAULT_ORDERS) then
            player:delKeyItem(dsp.ki.MAMOOL_JA_ASSAULT_ORDERS)
        elseif player:hasKeyItem(dsp.ki.LEBROS_ASSAULT_ORDERS) then
            player:delKeyItem(dsp.ki.LEBROS_ASSAULT_ORDERS)
        elseif player:hasKeyItem(dsp.ki.PERIQIA_ASSAULT_ORDERS) then
            player:delKeyItem(dsp.ki.PERIQIA_ASSAULT_ORDERS)
        elseif player:hasKeyItem(dsp.ki.ILRUSI_ASSAULT_ORDERS ) then
            player:delKeyItem(dsp.ki.ILRUSI_ASSAULT_ORDERS)
        elseif player:hasKeyItem(dsp.ki.NYZUL_ISLE_ASSAULT_ORDERS) then
            player:delKeyItem(dsp.ki.NYZUL_ISLE_ASSAULT_ORDERS)
        end
        npcUtil.giveKeyItem(player, dsp.ki.IMPERIAL_ARMY_ID_TAG)
        player:delAssault(currentAssault)
    end

end
