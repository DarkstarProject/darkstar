-----------------------------------
--  Area: The Colosseum
--  NPC:  Zandjarl
--  Type: Pankration NPC
-----------------------------------
package.loaded["scripts/zones/The_Colosseum/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
	    player:tradeComplete();
		player:addCurrency("jetton", 2);
		player:messageSpecial(CURRENCY_OBTAINED, 2, player:getCurrency("jetton"));
    elseif (trade:hasItemQty(2185,1) and trade:getItemCount() == 1) then
		    player:tradeComplete();
			player:addCurrency("jetton", 10);
			player:messageSpecial(CURRENCY_OBTAINED, 10, player:getCurrency("jetton"));
	elseif (trade:hasItemQty(2186,1) and trade:getItemCount() == 1) then
			player:tradeComplete();
			player:addCurrency("jetton", 30);
			player:messageSpecial(CURRENCY_OBTAINED, 30, player:getCurrency("jetton"));
	elseif (trade:hasItemQty(2187,1) and trade:getItemCount() == 1) then
			player:tradeComplete();
			player:addCurrency("jetton", 200);
			player:messageSpecial(CURRENCY_OBTAINED, 200, player:getCurrency("jetton"));		
	end	
end;
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------


function onTrigger(player,npc)
player:startEvent(1900);	
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

