-----------------------------------
--  Area: Sauromugue Champaign
--  NPC:  qm3 (???) (Tower 3) 
--  Involved in Quest: THF AF "As Thick As Thieves"
--  @pos 417.121 15.598 -137.466 120
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

	local thickAsThievesGrapplingCS = player:getVar("thickAsThievesGrapplingCS");

	if (thickAsThievesGrapplingCS >= 2 and thickAsThievesGrapplingCS <= 7) then
		if (trade:hasItemQty(17474,1) and trade:getItemCount() == 1) then -- Trade grapel
			player:messageSpecial(THF_AF_WALL_OFFSET+3,0,17474); -- You cannot get a decent grip on the wall using the [Grapnel].
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
		if (thickAsThievesGrapplingCS == 3) then
			player:messageSpecial(THF_AF_MOB);	
			SpawnMob(17269107,120):updateClaim(player); -- Climbpix Highrise
			setMobPos(17269107,414,16,-131,0);		
		elseif (thickAsThievesGrapplingCS == 0 or thickAsThievesGrapplingCS == 1 or
			thickAsThievesGrapplingCS == 2 or thickAsThievesGrapplingCS == 4 or
			thickAsThievesGrapplingCS == 5 or thickAsThievesGrapplingCS == 6 or
			thickAsThievesGrapplingCS == 7) then
			player:messageSpecial(THF_AF_WALL_OFFSET);
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
end;