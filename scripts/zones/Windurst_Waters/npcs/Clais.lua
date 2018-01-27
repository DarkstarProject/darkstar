-----------------------------------
-- Area: Windurst Waters
--  NPC: Clais
-- Involved In Quest: Hat in Hand
-- !pos -31 -3 11 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Walls/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    function testflag(set,flag)
        return (set % (2*flag) >= flag)
    end
    hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
    if ((hatstatus == 1 or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),8) == false) then
        player:startEvent(57); -- Show Off Hat
    else
        player:startEvent(602); -- Standard Conversation
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 57) then  -- Show Off Hat
        player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+8);
        player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
    end
end;


