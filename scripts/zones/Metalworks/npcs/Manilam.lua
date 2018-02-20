-----------------------------------
-- Area: Metalworks
--  NPC: Manilam
-- Type: Quest NPC
-- !pos -57.300 -11 22.332 237
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,7) == false) then
        player:startEvent(931);
    else
        player:startEvent(401);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 931) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",7,true);
    end

end;

