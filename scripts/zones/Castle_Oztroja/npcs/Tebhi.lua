-----------------------------------
-- Area: Castle Oztroja
-- NPC:  Tebhi
-- @pos -136 24 -21 151
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (trade:hasItemQty(13121,1) and trade:getItemCount() == 1) then -- Trade Beast collar
        player:tradeComplete();
        -- Tebhi disappears for 15min -------------- NOT IMPLEMENTED
        player:setVar("scatIntoShadowCS",2);
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;