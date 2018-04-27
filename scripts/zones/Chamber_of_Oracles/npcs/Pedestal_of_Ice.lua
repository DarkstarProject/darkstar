-----------------------------------
-- Area: Chamber of Oracles
--  NPC: Pedestal of Ice
-- Involved in Zilart Mission 7
-- !pos 199 -2 36 168
-------------------------------------
package.loaded["scripts/zones/Chamber_of_Oracles/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Chamber_of_Oracles/TextIDs");
-------------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local ZilartStatus = player:getVar("ZilartStatus");

    if (player:getCurrentMission(ZILART) == THE_CHAMBER_OF_ORACLES) then
        if (player:hasKeyItem(dsp.kis.ICE_FRAGMENT)) then
            player:delKeyItem(dsp.kis.ICE_FRAGMENT);
            player:setVar("ZilartStatus",ZilartStatus + 8);
            player:messageSpecial(YOU_PLACE_THE,dsp.kis.ICE_FRAGMENT);

            if (ZilartStatus == 255) then
                player:startEvent(1);
            end
        elseif (ZilartStatus == 255) then -- Execute cutscene if the player is interrupted.
            player:startEvent(1);
        else
            player:messageSpecial(IS_SET_IN_THE_PEDESTAL,dsp.kis.ICE_FRAGMENT);
        end
    elseif (player:hasCompletedMission(ZILART,THE_CHAMBER_OF_ORACLES)) then
        player:messageSpecial(HAS_LOST_ITS_POWER,dsp.kis.ICE_FRAGMENT);
    else
        player:messageSpecial(PLACED_INTO_THE_PEDESTAL);
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
        player:addTitle(LIGHTWEAVER);
        player:setVar("ZilartStatus",0);
        player:addKeyItem(dsp.kis.PRISMATIC_FRAGMENT);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.PRISMATIC_FRAGMENT);
        player:completeMission(ZILART,THE_CHAMBER_OF_ORACLES);
        player:addMission(ZILART,RETURN_TO_DELKFUTTS_TOWER);
    end

end;
