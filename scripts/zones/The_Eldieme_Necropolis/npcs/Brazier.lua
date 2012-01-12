-----------------------------------
-- Area: The Eldieme Necropolis
-- NPC:  Brazier
-- Involved in Quests: Save my Sister
-- @zone 195
-- @pos 101 -33 -59 (F-9)
-- @pos 259 -33 99 (H-7)
-- @pos 99 -33 98 (F-7)
-- @pos 259 -33 -58 (H-9)
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
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
	if(player:getQuestStatus(JEUNO,SAVE_MY_SISTER) == QUEST_ACCEPTED and player:getVar("saveMySisterFireLantern") < 4) then
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
	if(csid == 0x002c and option == 0) then 
		LanternOrder = player:getVar("saveMySisterFireLantern");
		X = player:getXPos();
		Z = player:getZPos();
		
		if(LanternOrder == 0) then
			if(X >= 94 and X <= 105 and Z >= -68 and Z <= -51) then --(F-9)
				-- "The Ducal Guard's lantern lights dimly."
				player:messageSpecial(THE_LIGHT_DIMLY);
				player:setVar("saveMySisterFireLantern",1);
			else
				-- "Unexpectedly, the Ducal Guard's lantern refuses to light."
				player:messageSpecial(REFUSE_TO_LIGHT);
			end
		elseif(LanternOrder == 1) then
			if(X >= 251 and X <= 265 and Z >= 91 and Z <= 108) then --(H-7)
				-- "The light of Ducal Guard's lantern has intensified."
				player:messageSpecial(THE_LIGHT_HAS_INTENSIFIED);
				player:setVar("saveMySisterFireLantern",2);
			else
				-- "For some strange reason, the light of the Ducal Guard's lantern goes out..."
				player:messageSpecial(LANTERN_GOES_OUT);
				player:setVar("saveMySisterFireLantern",0);
			end
		elseif(LanternOrder == 2) then
			if(X >= 94 and X <= 105 and Z >= 91 and Z <= 108) then --(F-7)
				-- "The light of Ducal Guard's lantern has intensified."
				player:messageSpecial(THE_LIGHT_HAS_INTENSIFIED);
				player:setVar("saveMySisterFireLantern",3);
			else
				-- "For some strange reason, the light of the Ducal Guard's lantern goes out..."
				player:messageSpecial(LANTERN_GOES_OUT);
				player:setVar("saveMySisterFireLantern",0);
			end
		elseif(LanternOrder == 3) then
			if(X >= 251 and X <= 265 and Z >= -68 and Z <= -51) then --(H-9)
				-- "The Ducal Guard's lantern is fully lit!"
				player:messageSpecial(THE_LIGHT_IS_FULLY_LIT);
				player:setVar("saveMySisterFireLantern",4);
			else
				-- "For some strange reason, the light of the Ducal Guard's lantern goes out..."
				player:messageSpecial(LANTERN_GOES_OUT);
				player:setVar("saveMySisterFireLantern",0);
			end
		end
	end
end;