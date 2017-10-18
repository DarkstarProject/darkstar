-----------------------------------
-- Area: Mine_Shaft_2716
-- NPC:  Shaft entrance
-----------------------------------
package.loaded["scripts/zones/Mine_Shaft_2716/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Mine_Shaft_2716/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getCurrentMission(COP) == THREE_PATHS and ( player:getVar("COP_Louverance_s_Path") == 7 or player:getVar("COP_Louverance_s_Path") == 8 )) then
        if (trade:getItemCount() == 1 and trade:hasItemQty(1684,1)) then            
            player:startEvent(0x0003);
        end
    else
        TradeBCNM(player,npc,trade);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) ==FIRE_IN_THE_EYES_OF_MEN and player:getVar("PromathiaStatus")==0) then
        player:startEvent(0x0004);
    else
        EventTriggerBCNM(player,npc);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option,extras)
    EventUpdateBCNM(player,csid,option,extras);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid ==0x0003) then
        player:setVar("COP_Louverance_s_Path",9);
        player:tradeComplete();
    elseif (csid ==0x0004) then 
        player:setVar("PromathiaStatus",1);
    else
        EventFinishBCNM(player,csid,option);
    end
end;