-----------------------------------
--    Area: Windurst Waters
--    NPC: Pechiru-Mashiru
--    Involved in Quests: Hat in Hand
--    Working 100%
--  @zone = 238
--  @pos = 162 -2 159
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    function testflag(set,flag)
        return (set % (2*flag) >= flag)
    end
    hatstatus = player:getQuestStatus(WINDURST,HAT_IN_HAND);
    if ((hatstatus == 1  or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),64) == false) then
        player:startEvent(0x0036); -- Show Off Hat
    else
        player:startEvent(0x01a5); -- Standard Conversation
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0036) then  -- Show Off Hat
        player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+64);
        player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
    end
end;



