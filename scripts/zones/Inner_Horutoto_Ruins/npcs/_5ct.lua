-----------------------------------
-- Area: Inner Horutoto Ruins
--  NPC: _5ct (Magical Gizmo) #5
--  Involved In Mission: The Horutoto Ruins Experiment
-----------------------------------
require("scripts/globals/missions");
local ID = require("scripts/zones/Inner_Horutoto_Ruins/IDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- The Magical Gizmo Number, this number will be compared to the random
    -- value created by the mission The Horutoto Ruins Experiment, when you
    -- reach the Gizmo Door and have the cutscene
    local magical_gizmo_no = 5; -- of the 6

    -- Check if we are on Windurst Mission 1-1
    if (player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_HORUTOTO_RUINS_EXPERIMENT and player:getVar("MissionStatus") == 2) then
        -- Check if we found the correct Magical Gizmo or not
        if (player:getVar("MissionStatus_rv") == magical_gizmo_no) then
            player:startEvent(56);
        else
            if (player:getVar("MissionStatus_op5") == 2) then
                -- We've already examined this
                player:messageSpecial(ID.text.EXAMINED_RECEPTACLE);
            else
                -- Opened the wrong one
                player:startEvent(57);
            end
        end
    end

    return 1;

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- If we just finished the cutscene for Windurst Mission 1-1
    -- The cutscene that we opened the correct Magical Gizmo
    if (csid == 56) then
        player:setVar("MissionStatus",3);
        player:setVar("MissionStatus_rv", 0);
        player:addKeyItem(dsp.ki.CRACKED_MANA_ORBS);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.CRACKED_MANA_ORBS);
    elseif (csid == 57) then
        -- Opened the wrong one
        player:setVar("MissionStatus_op5", 2);
        -- Give the message that thsi orb is not broken
        player:messageSpecial(ID.text.NOT_BROKEN_ORB);
    end

end;