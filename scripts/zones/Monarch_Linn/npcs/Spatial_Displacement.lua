-----------------------------------
-- Area: Monarch_Linn
-- NPC:  Spatial Displacement
-- @pos -35 -1 -539 31
-----------------------------------
package.loaded["scripts/zones/Monarch_LinnTextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Monarch_Linn/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
    
    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    --printf("npcID : %u",npcID);
    
    local npcID = npc:getID();
    local X = player:getXPos();
    local Z = player:getZPos();
    
    
    if (X > 12.934 and X < 24.934) then
        if (player:getPreviousZone() == 30) then
            player:startEvent(0x0B); -- To Riv Site A
        elseif (player:getPreviousZone() == 29) then
            player:startEvent(0x0A); -- To Riv Site B
        end
    elseif ((X > -524.521 and X < -512.521) or (X > 75.524 and X < 87.524) or (X > 675.271 and X < 687.271)) then
        player:startEvent(0x7d03);  -- leave the battlefield
    elseif (X > -25.684 and X < -13.684) then -- post-battlefield exit
        player:startEvent(0x0007);
    elseif (EventTriggerBCNM(player,npc)) then  -- enter the battlefield
        return 1;
    else
        player:messageSpecial(GLOWING_MIST); -- needs confirmation
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
    
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
    
    if (csid == 0x0B and option == 1) then
        player:setPos(-508.582,-8.471,-387.670,92,30); -- To Riv Site A (Retail confirmed)
    elseif (csid == 0x0A and option == 1) then
        player:setPos(-533.690,-20.5,503.656,224,29); -- To Riv Site B (Retail confirmed)
    elseif (csid == 0x0007 and option ==1) then
        player:setPos(-538.526,-29.5,359.219,255,25); -- back to Misareaux Coast (Retail confirmed)
    elseif (EventFinishBCNM(player,csid,option)) then
        return;
    end
    
end;