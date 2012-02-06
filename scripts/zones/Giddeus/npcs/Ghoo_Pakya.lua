-----------------------------------
-- Area: Giddeus
-- NPC: Uu Zhoumo
-- Involved in Mission 2-3
-----------------------------------

package.loaded["scripts/globals/settings"] = nil;
package.loaded["scripts/globals/missions"] = nil;
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getCurrentMission(WINDURST) == THE_PRICE_OF_PEACE) then
		windurst_mission_1_3 = player:getVar("windurst_mission_1_3");
		if(windurst_mission_1_3 >= 2) then
			if(player:hasKeyItem(DRINK_OFFERINGS)) then
				-- We have the offerings
				player:startEvent(0x31);
			else
				if(player:getVar("ghoo_talk") == 1) then
					-- npc: You want your offering back?
					player:startEvent(0x32);
				elseif(player:getVar("ghoo_talk") == 2) then
					-- npc: You'll have to crawl back to treasure chamber, etc
					player:startEvent(0x33);
				else
					-- We don't have the offerings yet or anymore
					player:startEvent(0x34);
				end
			end
		end
	else
		player:startEvent(0x34);
	end
end
	
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
	if(csid == 0x31) then
		if(player:hasKeyItem(DRINK_OFFERINGS)) then
			-- Delete the offering
			player:delKeyItem(DRINK_OFFERINGS);
			
			-- Set a variable to determine what the npc should say next
			-- time the player initiates a conversation
			player:setVar("ghoo_talk",1);
			player:setVar("drink_offering_delivered",2);
			
			if(player:getVar("food_offering_delivered") == 2 and player:getVar("drink_offering_delivered") == 2) then
				player:setVar("windurst_mission_1_3",3);
			end
		end
	elseif(csid == 0x32) then
		player:setVar("ghoo_talk",2);
	end
end;



