-----------------------------------
-- Area: La_Theine Plateau
--  NPC: Shattered Telepoint
-- !pos 334 19 -60 102
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == dsp.mission.id.cop.BELOW_THE_ARKS and player:getCharVar("PromathiaStatus") == 1) then
        player:startEvent(202,0,0,1); -- first time in promy -> have you made your preparations cs
    elseif (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_MOTHERCRYSTALS and (player:hasKeyItem(dsp.ki.LIGHT_OF_MEA) or player:hasKeyItem(dsp.ki.LIGHT_OF_DEM))) then
        if (player:getCharVar("cspromy2") == 1) then
            player:startEvent(201);  -- cs you get nearing second promyvion
        else
            player:startEvent(202)
        end
    elseif (player:getCurrentMission(COP) > dsp.mission.id.cop.THE_MOTHERCRYSTALS or player:hasCompletedMission(COP,dsp.mission.id.cop.THE_LAST_VERSE) or (player:getCurrentMission(COP) == dsp.mission.id.cop.BELOW_THE_ARKS and player:getCharVar("PromathiaStatus") > 1)) then
        player:startEvent(202); -- normal cs (third promyvion and each entrance after having that promyvion visited or mission completed)
    elseif
        player:getCurrentMission(ROV) == dsp.mission.id.rov.THE_PATH_UNTRAVELED and 
        player:getFameLevel(player:getNation()) >= 3
    then
        player:startEvent(14)
    elseif player:getCurrentMission(ROV) == dsp.mission.id.rov.A_LAND_AFTER_TIME then
        player:startEvent(15) 
    else
        player:messageSpecial(ID.text.TELEPOINT_HAS_BEEN_SHATTERED);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 201) then
        player:setCharVar("cspromy2",0);
        player:setCharVar("cs2ndpromy",1);
        player:setPos(-266.76, -0.635, 280.058, 0, 14); -- To Hall of Transference {R}
    elseif (csid == 202 and option == 0) then
        player:setPos(-266.76, -0.635, 280.058, 0, 14); -- To Hall of Transference {R}
    elseif csid == 14 then
        player:completeMission(ROV, dsp.mission.id.rov.THE_PATH_UNTRAVELED)
        player:addMission(ROV, dsp.mission.id.rov.AT_THE_HEAVENS_DOOR)
    elseif csid == 15 then
        npcUtil.giveKeyItem(player, dsp.ki.RHAPSODY_IN_UMBER)
        player:completeMission(ROV, dsp.mission.id.rov.A_LAND_AFTER_TIME)
        player:addMission(ROV, dsp.mission.id.rov.FATES_CALL)
    end

end;
