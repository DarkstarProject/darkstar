-----------------------------------
-- Area: Metalworks
--  NPC: Lucius
-- Involved in Mission: Bastok 3-3
-- Involved in Quest: Riding on the Clouds
-- !pos 59.959 -17.39 -42.321 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 8) then
        if (trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
            player:setVar("ridingOnTheClouds_2",0);
            player:tradeComplete();
            player:addKeyItem(dsp.kis.SMILING_STONE);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.SMILING_STONE);
        end
    end

end;

function onTrigger(player,npc)

    if (player:getCurrentMission(BASTOK) == JEUNO_MISSION and player:getVar("MissionStatus") == 0) then
        player:startEvent(322);
    else
        player:startEvent(320);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 322) then
        player:setVar("MissionStatus",1);
        player:addKeyItem(dsp.kis.LETTER_TO_THE_AMBASSADOR);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.LETTER_TO_THE_AMBASSADOR);
    end

end;