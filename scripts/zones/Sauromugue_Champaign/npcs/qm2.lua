-----------------------------------
--  Area: Sauromugue Champaign
--  NPC: qm2 (???) (Tower 2) 
--  Involved in Quest: THF AF "As Thick As Thieves"
--  @pos 196.830 31.300 206.078 120
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/status");
require("scripts/zones/Sauromugue_Champaign/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local thickAsThievesGrapplingCS = player:getVar("thickAsThievesGrapplingCS");

	if (thickAsThievesGrapplingCS >= 2 and thickAsThievesGrapplingCS <= 7) then
		if (trade:hasItemQty(17474,1) and trade:getItemCount() == 1) then -- Trade grapel
			if (player:getEquipID(SLOT_MAIN) == 0 and player:getEquipID(SLOT_SUB) == 0 and 
				player:getEquipID(SLOT_RANGED) == 0 and player:getEquipID(SLOT_AMMO) == 0 and 
				player:getEquipID(SLOT_HEAD) == 0 and player:getEquipID(SLOT_BODY) == 0 and 
				player:getEquipID(SLOT_HANDS) == 0 and player:getEquipID(SLOT_LEGS) == 0 and
				player:getEquipID(SLOT_FEET) == 0 and player:getEquipID(SLOT_NECK) == 0 and
				player:getEquipID(SLOT_WAIST) == 0 and player:getEquipID(SLOT_EAR1) == 0 and
				player:getEquipID(SLOT_EAR2) == 0 and player:getEquipID(SLOT_RING1) == 0 and
				player:getEquipID(SLOT_RING2) == 0 and player:getEquipID(SLOT_BACK) == 0) then
				player:startEvent(0x0002); -- complete grappling part of the quest			
			else 
				player:messageSpecial(THF_AF_WALL_OFFSET+2,0,17474); --  You try climbing the wall using the [Grapnel], but you are too heavy.
			end	
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local thickAsThieves = player:getQuestStatus(WINDURST,AS_THICK_AS_THIEVES);
	local thickAsThievesGrapplingCS = player:getVar("thickAsThievesGrapplingCS");
	
	if (thickAsThieves == QUEST_ACCEPTED) then
		if (thickAsThievesGrapplingCS == 2) then
			player:messageSpecial(THF_AF_MOB);	
			SpawnMob(17269107,120):updateClaim(player); -- Climbpix Highrise
			setMobPos(17269107,193,32,211,0);	
		elseif (thickAsThievesGrapplingCS == 0 or thickAsThievesGrapplingCS == 1 or
			thickAsThievesGrapplingCS == 3 or thickAsThievesGrapplingCS == 4 or
			thickAsThievesGrapplingCS == 5 or thickAsThievesGrapplingCS == 6 or
			thickAsThievesGrapplingCS == 7) then
			player:messageSpecial(THF_AF_WALL_OFFSET);	--  It is impossible to climb this wall with your bare hands.
		elseif (thickAsThievesGrapplingCS == 8) then
			player:messageSpecial(THF_AF_WALL_OFFSET+1); -- There is no longer any need to climb the tower.
		end	
	else 
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);			
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
	
	if (csid == 0x0002) then
		player:setVar("thickAsThievesGrapplingCS",8);
		player:delKeyItem(FIRST_FORGED_ENVELOPE);
		player:addKeyItem(FIRST_SIGNED_FORGED_ENVELOPE);
		player:messageSpecial(KEYITEM_OBTAINED,FIRST_SIGNED_FORGED_ENVELOPE);
		player:tradeComplete();
	end
	
end;