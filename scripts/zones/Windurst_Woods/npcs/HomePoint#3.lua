-----------------------------------
-- Area: Windurst Woods
-- NPC:  HomePoint#3
-- @pos -92 -5 62 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/homepoint");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (HOMEPOINT_HEAL == 1) then
		player:addHP(player:getMaxHP());
		player:addMP(player:getMaxMP());
	end
	if(HOMEPOINT_TELEPORT == 1)then
		--                       ?/1-Ru'lude5 /Lude-Ru'Aun/Tav-end/     ?/Gil /Expantion level/Registered   
		player:startEvent(0x21fe,0,player:getVar("hpmask1"),player:getVar("hpmask2"),player:getVar("hpmask3"),player:getVar("hpmask4"),player:getGil(),4095,27 + addtohps(player,1,27));
	else
		player:startEvent(0x21fe)
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
	if(csid == 0x21fe) then
		if (option == 1) then	
			player:setHomePoint();
			player:messageSpecial(HOMEPOINT_SET);
		else
			hpteleport(player,option);
		end
	end
end;	



