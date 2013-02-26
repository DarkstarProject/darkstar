-----------------------------------
-- Area: Aydeewa Subterrane
-- NPC:  ??? (Spawn Pandemonium Warden)
-- @pos -217 35 12 68
-----------------------------------
package.loaded["scripts/zones/Aydeewa_Subterrane/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aydeewa_Subterrane/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(trade:hasItemQty(2572,1) and trade:getItemCount() == 1 and GetMobAction(17056168) == 0) then --pandemonium key
		player:tradeComplete();
		-- Pandemonium Warden
		SpawnMob(17056168,180):updateEnmity(player);
		-- Pets
		for i = 17056170, 17056177, 1 do 
			SpawnMob(i,180):updateEnmity(player);
		end
		PWardenDespawnTime = os.time(t) + 7200; -- Two hours to forcible depop, if PWarden is engaged.
		PWardenAstralFlows = 0;
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_HAPPENS);
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