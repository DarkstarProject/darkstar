-----------------------------------
--  Area: Northern San d'Oria
--  NPC: Shomo Pochachilo
--  Type: Standard Info NPC
--  @zone: 231
--  @pos 28.369 -0.199 30.061
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    quest_FatherAndSon = player:getQuestStatus(SANDORIA,FATHER_AND_SON);
    
    if (quest_FatherAndSon == QUEST_COMPLETED) then 
        player:startEvent(0x02b8);
    else
        player:startEvent(0x02a3);
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

