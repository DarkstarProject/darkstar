-----------------------------------
--    Area: Windurst Waters
--    NPC:  Machitata
--    Involved in Quest: Hat in Hand
--    Working 100%
--  @zone = 238
--  @pos = 163 0 -22
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Waters/TextIDs");

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
    if ((hatstatus == 1  or player:getVar("QuestHatInHand_var2") == 1) and testflag(tonumber(player:getVar("QuestHatInHand_var")),1) == false) then
        player:messageSpecial(7121); -- Show Off Hat
        player:setVar("QuestHatInHand_var",player:getVar("QuestHatInHand_var")+1);
        player:setVar("QuestHatInHand_count",player:getVar("QuestHatInHand_count")+1);
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
end;



