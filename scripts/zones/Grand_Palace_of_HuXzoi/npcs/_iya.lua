-----------------------------------
--  Area: Grand Palace of Hu'Xzoi
--  NPC:  Gate of the Gods
--  @pos -20 0.1 -283 34
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
   
    if (player:getCurrentMission(COP) == GARDEN_OF_ANTIQUITY and player:getVar("PromathiaStatus") == 3) then
        player:startEvent(0x0001);
    else
        player:startEvent(0x0034);
    end
    return 1;
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
    
    if (csid == 0x0034 and option == 1) then
        player:setPos(-419.995,0,248.483,191,35); -- To The Garden of RuHmet {R}
    elseif (csid == 0x0001) then    
        player:setVar("PromathiaStatus",0);
        player:completeMission(COP, GARDEN_OF_ANTIQUITY);
        player:addMission(COP, A_FATE_DECIDED);
        player:addItem(14672);
        player:messageSpecial(ITEM_OBTAINED, 14672); 
    end
    
end;