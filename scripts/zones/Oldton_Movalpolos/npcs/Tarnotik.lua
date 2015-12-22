-----------------------------------
--  Area: Oldton Movalpolos
--  NPC:  Tarnotik
--  Type: Standard NPC
--  @pos 160.896 10.999 -55.659 11
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Oldton_Movalpolos/TextIDs");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getCurrentMission(COP) >= THREE_PATHS) then
        if (trade:getItemCount() == 1 and trade:hasItemQty(1725,1)) then
            player:tradeComplete();
            player:startEvent(0x0020);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Louverance_s_Path") == 7 ) then
        player:startEvent(0x0022);
    else
        if (math.random()<0.5) then -- this isnt retail at all. 
            player:startEvent(0x001e);
        else
            player:startEvent(0x001f);
        end
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
    if (csid == 0x0020) then
        player:setPos(-116,-119,-620,253,13);
    elseif (csid == 0x0022) then  
        player:setVar("COP_Louverance_s_Path",8);
    end
end;

