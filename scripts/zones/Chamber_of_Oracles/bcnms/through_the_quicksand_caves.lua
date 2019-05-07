-----------------------------------
-- Area: Chamber of Oracles
-- Name: Zilart Mission 6
-- !pos -221 -24 19 206
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onBcnmRegister(player,instance)
end

function onBcnmEnter(player,instance)
end

function onBcnmLeave(player,instance,leavecode)
    if leavecode == 2 then -- play end CS. Need time and battle id for record keeping + storage
        if player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THROUGH_THE_QUICKSAND_CAVES then
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,0)
        else
            player:startEvent(32001,1,1,1,instance:getTimeInside(),1,0,1)
        end
    elseif leavecode == 4 then
        player:startEvent(32002)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 32001 then
        if player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THROUGH_THE_QUICKSAND_CAVES then
            player:completeMission(ZILART, dsp.mission.id.zilart.THROUGH_THE_QUICKSAND_CAVES)
            player:addMission(ZILART, dsp.mission.id.zilart.THE_CHAMBER_OF_ORACLES)
        end
    end
end