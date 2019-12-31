-----------------------------------
-- Area: Chamber of Oracles
--  NPC: Pedestal of Lightning
-- Involved in Zilart Mission 7
-- !pos 199 -2 36 168
-------------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
local ID = require("scripts/zones/Chamber_of_Oracles/IDs");
-------------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ZilartStatus = player:getCharVar("ZilartStatus");

    if (player:getCurrentMission(ZILART) == dsp.mission.id.zilart.THE_CHAMBER_OF_ORACLES) then
        if (player:hasKeyItem(dsp.ki.LIGHTNING_FRAGMENT)) then
            player:delKeyItem(dsp.ki.LIGHTNING_FRAGMENT);
            player:setCharVar("ZilartStatus",ZilartStatus + 32);
            player:messageSpecial(ID.text.YOU_PLACE_THE,dsp.ki.LIGHTNING_FRAGMENT);

            if (ZilartStatus == 255) then
                player:startEvent(1);
            end
        elseif (ZilartStatus == 255) then -- Execute cutscene if the player is interrupted.
            player:startEvent(1);
        else
            player:messageSpecial(ID.text.IS_SET_IN_THE_PEDESTAL,dsp.ki.LIGHTNING_FRAGMENT);
        end
    elseif (player:hasCompletedMission(ZILART,dsp.mission.id.zilart.THE_CHAMBER_OF_ORACLES)) then
        player:messageSpecial(ID.text.HAS_LOST_ITS_POWER,dsp.ki.LIGHTNING_FRAGMENT);
    else
        player:messageSpecial(ID.text.PLACED_INTO_THE_PEDESTAL);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("onUpdate CSID: %u",csid);
    -- printf("onUpdate RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("onFinish CSID: %u",csid);
    -- printf("onFinish RESULT: %u",option);

    if (csid == 1) then
        player:addTitle(dsp.title.LIGHTWEAVER);
        player:setCharVar("ZilartStatus",0);
        player:addKeyItem(dsp.ki.PRISMATIC_FRAGMENT);
        player:messageSpecial(ID.text.KEYITEM_OBTAINED,dsp.ki.PRISMATIC_FRAGMENT);
        player:completeMission(ZILART,dsp.mission.id.zilart.THE_CHAMBER_OF_ORACLES);
        player:addMission(ZILART,dsp.mission.id.zilart.RETURN_TO_DELKFUTTS_TOWER);
    end

end;
