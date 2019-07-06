-----------------------------------
-- Area: Western Adoulin (256)
--  NPC: Levil
-- Type: Quest and SoA Missions NPC
-- !pos -87.204 3.350 12.655
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local arceliaAppears = player:getCurrentMission(SOA) == dsp.mission.id.soa.ARCIELA_APPEARS_AGAIN

    if arceliaAppears and player:getFameLevel(ADOULIN) >= 4 then
        player:startEvent(6)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 6 and option == 1 then
        player:completeMission(SOA,dsp.mission.id.soa.ARCIELA_APPEARS_AGAIN)
        player:addMission(SOA,dsp.mission.id.soa.BUILDING_PROSPECTS)
    end
end
