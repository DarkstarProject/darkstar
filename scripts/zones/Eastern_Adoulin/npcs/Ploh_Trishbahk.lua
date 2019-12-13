-----------------------------------
-- Area: Eastern Adoulin (257)
--  NPC: Ploh Trishbahk
-- Type: Palace Guard
-- !pos 100.580 -40.150 -63.830
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local meetingOfTheMinds = player:getCurrentMission(SOA) == dsp.mission.id.soa.MEETING_OF_THE_MINDS
    local dinnerTime = VanadielHour() >= 15 and VanadielHour() <= 22

    if meetingOfTheMinds then
        player:startEvent(dinnerTime and 1500 or 1501)
    else
        player:startEvent(563)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 1500 then
        player:delKeyItem(dsp.ki.DINNER_INVITATION)

        player:completeMission(SOA,dsp.mission.id.soa.MEETING_OF_THE_MINDS)
        player:addMission(SOA,dsp.mission.id.soa.ARCIELA_APPEARS_AGAIN)
    end
end
