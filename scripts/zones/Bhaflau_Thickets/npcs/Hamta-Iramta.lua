-----------------------------------
--  Area: Bhaflau Thickets
--   NPC: Hamta-Iramta
--  Type: Alzadaal Undersea Ruins
-- @zone: 52
--  @pos -459.942 -20.048 -4.999
-- 
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (trade:getItemCount() == 1 and trade:hasItemQty(2185,1)) then -- Silver
		player:tradeComplete();
		player:setPos(-458,-16,0,189); -- using the pos method until the problem below is fixed
		-- player:startEvent(0x0087); -- << this CS goes black at the end, never fades in
		return 1;
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- NPC is on a slant which makes this really difficult
	
	if (player:getXPos() < -456 and player:getXPos() > -459 and player:getYPos() < -16.079) then 
		player:startEvent(0x0086);
			
	elseif (player:getXPos() < -459 and player:getXPos() > -462 and player:getYPos() < -16.070) then 
		player:startEvent(0x0086);

	elseif (player:getXPos() < -462 and player:getXPos() > -464 and player:getYPos() < -16.071) then 
		player:startEvent(0x0086);
		
	else
		player:startEvent(0x0088);
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

