-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Brazier
-- Involved in Quests: Save my Sister
-- @pos 101 -33 -59 195 (F-9)
-- @pos 259 -33 99 195 (H-7)
-- @pos 99 -33 98 195 (F-7)
-- @pos 259 -33 -58 195 (H-9)
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getQuestStatus(JEUNO,SAVE_MY_SISTER) == QUEST_ACCEPTED and player:getVar("saveMySisterFireLantern") < 4) then
		player:setVar("saveMySisterLanternID",npc:getID());
		player:startEvent(0x002c);
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end

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
	
	if (csid == 0x002c and option == 0) then 
		local LanternOrder = player:getVar("saveMySisterFireLantern");
		local npcID = player:getVar("saveMySisterLanternID");
		player:setVar("saveMySisterLanternID",0);
		
		if (LanternOrder == 0) then
			if (npcID == 17576343) then --(F-9)
				-- "The Ducal Guard's lantern lights dimly."
				player:messageSpecial(THE_LIGHT_DIMLY,0,0,0,DUCAL_GUARDS_LANTERN_LIT);
				player:setVar("saveMySisterFireLantern",1);
			else
				-- "Unexpectedly, the Ducal Guard's lantern refuses to light."
				player:messageSpecial(REFUSE_TO_LIGHT,0,0,0,DUCAL_GUARDS_LANTERN_LIT);
			end
		elseif (LanternOrder == 1) then
			if (npcID == 17576344) then --(H-7)
				-- "The light of Ducal Guard's lantern has intensified."
				player:messageSpecial(THE_LIGHT_HAS_INTENSIFIED,0,0,0,DUCAL_GUARDS_LANTERN_LIT);
				player:setVar("saveMySisterFireLantern",2);
			else
				-- "For some strange reason, the light of the Ducal Guard's lantern goes out..."
				player:messageSpecial(LANTERN_GOES_OUT,0,0,0,DUCAL_GUARDS_LANTERN_LIT);
				player:setVar("saveMySisterFireLantern",0);
			end
		elseif (LanternOrder == 2) then
			if (npcID == 17576345) then --(F-7)
				-- "The light of Ducal Guard's lantern has intensified."
				player:messageSpecial(THE_LIGHT_HAS_INTENSIFIED,0,0,0,DUCAL_GUARDS_LANTERN_LIT);
				player:setVar("saveMySisterFireLantern",3);
			else
				-- "For some strange reason, the light of the Ducal Guard's lantern goes out..."
				player:messageSpecial(LANTERN_GOES_OUT,0,0,0,DUCAL_GUARDS_LANTERN_LIT);
				player:setVar("saveMySisterFireLantern",0);
			end
		elseif (LanternOrder == 3) then
			if (npcID == 17576346) then --(H-9)
				-- "The Ducal Guard's lantern is fully lit!"
				player:messageSpecial(THE_LIGHT_IS_FULLY_LIT,0,0,0,DUCAL_GUARDS_LANTERN_LIT);
				player:setVar("saveMySisterFireLantern",4);
			else
				-- "For some strange reason, the light of the Ducal Guard's lantern goes out..."
				player:messageSpecial(LANTERN_GOES_OUT,0,0,0,DUCAL_GUARDS_LANTERN_LIT);
				player:setVar("saveMySisterFireLantern",0);
			end
		end
	end
	
end;
