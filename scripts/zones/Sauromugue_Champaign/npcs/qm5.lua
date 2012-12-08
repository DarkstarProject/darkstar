-----------------------------------
--  Area: Sauromugue Champaign
--   NPC: qm5 (Tower 5) 
--  Type: Standard NPC
--
-- THF Quest "As Thick As Thieves"
-- @zone: 120
-- @where x-114, y16, z51
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(thickAsThievesGrapplingCS == 6) then
		if(trade:hasItemQty(17474,1) and trade:getItemCount() == 1) then -- Trade grapel
			player:startEvent(0x0002); -- complete grappling part of the quest			
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	thickAsThieves = player:getQuestStatus(WINDURST,AS_THICK_AS_THIEVES);
	thickAsThievesGrapplingCS = player:getVar("thickAsThievesGrapplingCS");
	
	if(thickAsThievesGrapplingCS == 5) then
		SpawnMob(17269107,120):updateEnmity(player); -- Climbpix Highrise
		setMobPos(17269107,114,16,51,0);		
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
	
	if(csid == 0x0002) then
		player:setVar("thickAsThievesGrapplingCS",8);
		player:delKeyItem(FIRST_FORGED_ENVELOPE);
		player:addKeyItem(FIRST_SIGNED_FORGED_ENVELOPE);
		player:messageSpecial(KEYITEM_OBTAINED,FIRST_SIGNED_FORGED_ENVELOPE);
		player:tradeComplete();
	end
	
end;