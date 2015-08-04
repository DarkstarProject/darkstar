-----------------------------------
--  Area: Newton Movalpolos
--  NPC:  Furnace_Hatch
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Newton_Movalpolos/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:getItemCount() == 1 and trade:hasItemQty(947,1)) then
		player:tradeComplete(); 
		-- player:messageSpecial(???); -- Needs retail info
		
		local npcid = npc:getID();
		local Door_Offset = 16826582; -- _0c0 in NPC_List
		
		if (npcid == Door_Offset+29 or npcid == Door_Offset+28 or npcid == Door_Offset+27) then
			if (GetNPCByID(Door_Offset+10):getAnimation() == 8) then
				GetNPCByID(Door_Offset+10):setAnimation(9);  
				GetNPCByID(Door_Offset+11):setAnimation(8);
				GetNPCByID(Door_Offset+8):setAnimation(9);
				GetNPCByID(Door_Offset+9):setAnimation(8);
			else
				GetNPCByID(Door_Offset+10):setAnimation(8);
				GetNPCByID(Door_Offset+11):setAnimation(9);
				GetNPCByID(Door_Offset+8):setAnimation(8);
				GetNPCByID(Door_Offset+9):setAnimation(9);
			end
		elseif (npcid == Door_Offset+25) then
			if (GetNPCByID(Door_Offset+3):getAnimation() == 8) then
				GetNPCByID(Door_Offset+3):setAnimation(9); 
				GetNPCByID(Door_Offset+2):setAnimation(8);
				GetNPCByID(Door_Offset+1):setAnimation(9);
				GetNPCByID(Door_Offset):setAnimation(8);
			else
				GetNPCByID(Door_Offset+3):setAnimation(8); 
				GetNPCByID(Door_Offset+2):setAnimation(9);
				GetNPCByID(Door_Offset+1):setAnimation(8);
				GetNPCByID(Door_Offset):setAnimation(9);
			end
		elseif (npcid == Door_Offset+26) then  
			if (GetNPCByID(Door_Offset+4):getAnimation() == 8) then
				GetNPCByID(Door_Offset+4):setAnimation(9); 
				GetNPCByID(Door_Offset+5):setAnimation(8);
				GetNPCByID(Door_Offset+6):setAnimation(9);
				GetNPCByID(Door_Offset+7):setAnimation(8);
			else
				GetNPCByID(Door_Offset+4):setAnimation(8); 
				GetNPCByID(Door_Offset+5):setAnimation(9);
				GetNPCByID(Door_Offset+6):setAnimation(8);
				GetNPCByID(Door_Offset+7):setAnimation(9);
			end
		end		 
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