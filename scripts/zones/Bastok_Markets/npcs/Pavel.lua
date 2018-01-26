-----------------------------------
-- Area: Bastok Markets
--  NPC: Pavel
-- Involved in Quest: Stamp Hunt
-- !pos -349.798 -10.002 -181.296 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local WildcatBastok = player:getVar("WildcatBastok");
    local StampHunt = player:getQuestStatus(BASTOK,STAMP_HUNT);

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,14) == false) then
        player:startEvent(431);
    elseif (StampHunt == QUEST_ACCEPTED and player:getMaskBit(player:getVar("StampHunt_Mask"),2) == false) then
        player:startEvent(227);
    else
        player:startEvent(128);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 431) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",14,true);
    elseif (csid == 227) then
        player:setMaskBit(player:getVar("StampHunt_Mask"),"StampHunt_Mask",2,true);
    end

end;
