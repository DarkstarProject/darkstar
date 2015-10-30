-----------------------------------
-- Area: Pashhow_Marshlands(S)
-- NPC:  ??? (Kinepikwa)
-- Allow player to spawn Kinepikwa with Peiste pellets
-- 
-----------------------------------
-----------------------------------


-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	
	if (GetMobAction(17146147) == 0 and trade:hasItemQty(2564,1) and trade:getItemCount() == 1) then
		player:tradeComplete();
		SpawnMob(17146147,300):updateClaim(player); -- Kinepikwa
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
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;