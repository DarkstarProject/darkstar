-----------------------------------
-- Area: Windurst Waters
--  NPC: Bondada
-- Involved in Quests: Hat in Hand
-- !pos -66 -3 -148 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Walls/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    function testflag(set,flag)
        return (set % (2*flag) >= flag)
    end
    hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
    if ((hatstatus == 1  or player:getVar("QuestHatInHand_var2") == 1) and player:getVar("QuestHatInHand_var") < 127) then
        player:startEvent(53); -- Show Off Hat (She does not buy one)
    elseif ((hatstatus == 1 or player:getVar("QuestHatInHand_var2") == 1)  and player:getVar("QuestHatInHand_var") == 127) then
        player:startEvent(61); -- Show Off Hat (She buys one)
    else
        player:startEvent(43); -- Standard Conversation
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 61) then  -- Show Off Hat
        player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+128);
        player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
    end
end;



