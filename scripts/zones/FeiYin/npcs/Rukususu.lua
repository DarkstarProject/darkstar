-----------------------------------
--  Area: Fei'Yin
--  NPC: Rukususu (talk to Cermet Door _no5 to trigger)
--  Type: Quest NPC
--  @pos -194.133 -0.986 191.077 204
-- 	Involved in quests: Curses, Foiled A-Golem!?,SMN AF2: Class Reunion, SMN AF3: Carbuncle Debacle
--	Involved in Missions: Windurst 5-1/7-2/8-2
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/FeiYin/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- Curses, Foiled A_Golem!?
	if (player:hasKeyItem(SHANTOTTOS_NEW_SPELL)) then
		player:startEvent(0x000E); -- deliver spell
	elseif (player:hasKeyItem(SHANTOTTOS_EXSPELL)) then
		player:startEvent(0x000D); -- spell erased, try again!
	
	-- standard dialog
	else
		player:startEvent(0x000f); 
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
	
	-- Curses, Foiled A_Golem!?
	if (csid == 0x000E) then
		player:setVar("foiledagolemdeliverycomplete",1);
		player:delKeyItem(SHANTOTTOS_NEW_SPELL); -- remove key item
	end
end;

