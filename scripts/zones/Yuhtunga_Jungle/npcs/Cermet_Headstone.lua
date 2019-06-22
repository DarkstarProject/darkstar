-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Fire Fragment)
-- !pos 491 20 301 123
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/titles")
-----------------------------------

function onTrade(player,npc,trade)
    -- WRATH OF THE OPO-OPOS
    if npcUtil.tradeHas(trade, 790) then
        if not player:hasCompletedQuest(OUTLANDS,dsp.quest.id.outlands.WRATH_OF_THE_OPO_OPOS) and (player:hasCompletedMission(ZILART,dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE) or player:hasKeyItem(dsp.ki.FIRE_FRAGMENT)) then
            player:addQuest(OUTLANDS,dsp.quest.id.outlands.WRATH_OF_THE_OPO_OPOS)
            player:startEvent(202,790)
        else
            player:messageSpecial(ID.text.NOTHING_HAPPENS)
        end
    end
end

function onTrigger(player,npc)
    -- HEADSTONE PILGRIMAGE
    if player:getCurrentMission(ZILART) == dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE then
        if player:hasKeyItem(dsp.ki.FIRE_FRAGMENT) then
            player:messageSpecial(ID.text.ALREADY_OBTAINED_FRAG, dsp.ki.FIRE_FRAGMENT)
        elseif os.time() >= npc:getLocalVar("cooldown") then
            if not GetMobByID(ID.mob.TIPHA):isSpawned() and not GetMobByID(ID.mob.CARTHI):isSpawned() then
                player:startEvent(200, dsp.ki.FIRE_FRAGMENT)
            else
                player:messageSpecial(ID.text.SOMETHING_BETTER)
            end
        else
            player:addKeyItem(dsp.ki.FIRE_FRAGMENT)
            if
                player:hasKeyItem(dsp.ki.ICE_FRAGMENT) and
                player:hasKeyItem(dsp.ki.EARTH_FRAGMENT) and
                player:hasKeyItem(dsp.ki.WATER_FRAGMENT) and
                player:hasKeyItem(dsp.ki.WIND_FRAGMENT) and
                player:hasKeyItem(dsp.ki.LIGHTNING_FRAGMENT) and
                player:hasKeyItem(dsp.ki.LIGHT_FRAGMENT)
            then
                player:messageSpecial(ID.text.FOUND_ALL_FRAGS, dsp.ki.FIRE_FRAGMENT)
                player:addTitle(dsp.title.BEARER_OF_THE_EIGHT_PRAYERS)
                player:completeMission(ZILART, dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE)
                player:addMission(ZILART, dsp.mission.id.zilart.THROUGH_THE_QUICKSAND_CAVES)
            else
                player:messageSpecial(ID.text.KEYITEM_OBTAINED, dsp.ki.FIRE_FRAGMENT)
            end
        end

    -- DEFAULT DIALOGS
    elseif player:hasCompletedMission(ZILART,dsp.mission.id.zilart.HEADSTONE_PILGRIMAGE) then
        player:messageSpecial(ID.text.ZILART_MONUMENT)
    else
        player:messageSpecial(ID.text.CANNOT_REMOVE_FRAG)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    -- HEADSTONE PILGRIMAGE
    if csid == 200 and option == 1 then
        SpawnMob(ID.mob.TIPHA):updateClaim(player)
        SpawnMob(ID.mob.CARTHI):updateClaim(player)

    -- WRATH OF THE OPO-OPOS
    elseif csid == 202 and npcUtil.completeQuest(player, OUTLANDS, dsp.quest.id.outlands.WRATH_OF_THE_OPO_OPOS, {item=13143, title=dsp.title.FRIEND_OF_THE_OPOOPOS}) then
        player:confirmTrade()
    end
end