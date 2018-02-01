-----------------------------------
-- Area: Qufim Island
--  NPC: Nightflowers
-- Involved in Quest: Save My Son (Beastmaster Flag #1)
-- !pos -264.775 -3.718 28.767 126
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Qufim_Island/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local currentTime = VanadielHour();

    if (currentTime >= 22 or currentTime <= 4) then
        if (player:getQuestStatus(JEUNO,SAVE_MY_SON) == QUEST_ACCEPTED and player:getVar("SaveMySon_Event") == 0) then
            player:startEvent(0);
        else
            player:messageSpecial(NOW_THAT_NIGHT_HAS_FALLEN);
        end
    else
        player:messageSpecial(THESE_WITHERED_FLOWERS);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0) then
        player:setVar("SaveMySon_Event",1);
    end

end;