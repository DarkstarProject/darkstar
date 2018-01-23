-----------------------------------
-- Area: Bastok Mines
--  NPC: Echo Hawk
-- Standard Info NPC
-- Involved in Quest: The Siren's Tear
-- !pos -0.965 5.999 -15.567 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local SirensTear = player:getQuestStatus(BASTOK,THE_SIREN_S_TEAR);

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,17) == false) then
        player:startEvent(505);
    elseif (SirensTear == QUEST_AVAILABLE) then
        player:startEvent(5);
    else
        player:startEvent(13);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 505) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",17,true);
    end

end;