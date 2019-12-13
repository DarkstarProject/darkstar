-----------------------------------
-- Area: Tahrongi_Canyon
--  NPC: Shattered Telepoint
-- !pos 179 35 255 117
-----------------------------------
local ID = require("scripts/zones/Tahrongi_Canyon/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    if player:getCurrentMission(COP) == dsp.mission.id.cop.BELOW_THE_ARKS and player:getCharVar("PromathiaStatus") == 1 then
        player:startEvent(913, 0, 0, 1) -- first time in promy -> have you made your preparations cs
    elseif player:getCurrentMission(COP) == dsp.mission.id.cop.THE_MOTHERCRYSTALS and (player:hasKeyItem(dsp.ki.LIGHT_OF_HOLLA) or player:hasKeyItem(dsp.ki.LIGHT_OF_DEM)) then
        if player:getCharVar("cspromy2") == 1 then
            player:startEvent(912)  -- cs you get nearing second promyvion
        else
            player:startEvent(913)
        end
    elseif player:getCurrentMission(COP) > dsp.mission.id.cop.THE_MOTHERCRYSTALS or player:hasCompletedMission(COP, dsp.mission.id.cop.THE_LAST_VERSE) or (player:getCurrentMission(COP) == dsp.mission.id.cop.BELOW_THE_ARKS and player:getCharVar("PromathiaStatus") > 1) then
        player:startEvent(913) -- normal cs (third promyvion and each entrance after having that promyvion visited or mission completed)
    else
        player:messageSpecial(ID.text.TELEPOINT_HAS_BEEN_SHATTERED)
    end

end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 912 then
        player:setCharVar("cspromy2", 0)
        player:setCharVar("cs2ndpromy", 1)
        player:setPos(280.066, -80.635, -67.096, 191, 14) -- To Hall of Transference {R}
    elseif csid == 913 and option == 0 then
        player:setPos(280.066, -80.635, -67.096, 191, 14) -- To Hall of Transference {R}
    end
end