-----------------------------------
-- Area: Talacca_Cove
-- NPC:  rock slab (corsair job flag quest)
-- 
-----------------------------------
package.loaded["scripts/zones/Talacca_Cove/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Talacca_Cove/TextIDs");
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

    LuckOfTheDraw = player:getVar("LuckOfTheDraw");
    
    if (LuckOfTheDraw ==4) then
        player:startEvent(0x0003);        
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


    if (csid == 0x0003) then                    -- complete corsair job flag quest
        player:setVar("LuckOfTheDraw",5); -- var will remain for af quests        
        player:addItem(5493);
        player:messageSpecial(ITEM_OBTAINED,5493);    
        player:delKeyItem(FORGOTTEN_HEXAGUN);
        player:unlockJob(17);
        player:messageSpecial(YOU_CAN_NOW_BECOME_A_CORSAIR);
        player:completeQuest(AHT_URHGAN,LUCK_OF_THE_DRAW);
    end

end;