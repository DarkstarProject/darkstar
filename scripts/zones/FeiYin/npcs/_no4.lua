-----------------------------------
--  Area: Fei'Yin
--  NPC:  Cermet Door (triggers Rukususu dialog)
--  Type: Quest NPC
--  @pos -183 0 190 204
-- 	Involved in Quests: Curses, Foiled A-Golem!?,SMN AF2: Class Reunion, SMN AF3: Carbuncle Debacle
--	Involved in Missions: Windurst 5-1/7-2/8-2
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/FeiYin/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	-- Windurst 8-2
	if(player:getCurrentMission(WINDURST) == THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 1) then
		player:startEvent(0x0016);
		
	-- Curses, Foiled A_Golem!?
	if(player:hasKeyItem(SHANTOTTOS_NEW_SPELL)) then
		player:startEvent(0x000E); -- deliver spell
	elseif(player:hasKeyItem(SHANTOTTOS_EXSPELL)) then
		player:startEvent(0x000D); -- spell erased, try again!
	
	-- standard dialog
	else
		player:startEvent(0x000f); 
	end
	end
	return 1;
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
	
	-- Curses, Foiled A_Golem!?
	if(csid == 0x000E) then
		player:setVar("foiledagolemdeliverycomplete",1);
		player:delKeyItem(SHANTOTTOS_NEW_SPELL); -- remove key item
	elseif(csid == 0x0016) then
		player:addKeyItem(RHINOSTERY_RING);
		player:messageSpecial(KEYITEM_OBTAINED,RHINOSTERY_RING);
		if(player:hasKeyItem(AURASTERY_RING) and player:hasKeyItem(OPTISTERY_RING)) then
			player:setVar("MissionStatus",2)
		end
	end
end;
