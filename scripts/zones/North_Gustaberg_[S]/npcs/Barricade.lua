-----------------------------------
-- Area: North Gustaberg (S) (I-6)
-- NPC: Barricade
-- Involved in Quests: The Fighting Fourth
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,THE_FIGHTING_FOURTH) == QUEST_ACCEPTED and player:getVar("THE_FIGHTING_FOURTH") == 2) then
        player:startEvent(0x006A)
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x006A) then
        player:setVar("THE_FIGHTING_FOURTH",3);
    end        
end;
