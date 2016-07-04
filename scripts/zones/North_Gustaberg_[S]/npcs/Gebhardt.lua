-----------------------------------
-- Area: North Gustaberg (S) (I-6)
-- NPC: Gebhardt
-- Involved in Quests: The Fighting Fourth
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/North_Gustaberg_[S]/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR,THE_FIGHTING_FOURTH) == QUEST_ACCEPTED and player:hasKeyItem(917)) == true then
        player:startEvent(0x0066)
    else
        player:startEvent(0x006E)
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

    if (csid == 0x0066) then
            player:delKeyItem(BATTLE_RATIONS);
            player:setVar("THE_FIGHTING_FOURTH",1);
    end        
end;
