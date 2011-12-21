-----------------------------------
-- Area: Port Bastok
-- NPC: Jabbar
-- Type: Tenshodo Merchant
-- Involved in Quests: Tenshodo Menbership
-- @zone 236
-- @pos -99 -2 24
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getQuestStatus(JEUNO,TENSHODO_MEMBERSHIP) == QUEST_ACCEPTED and player:hasKeyItem(TENSHODO_APPLICATION_FORM) == false) then 
		-- CS NOT FOUND
		player:addKeyItem(TENSHODO_APPLICATION_FORM);
		player:messageSpecial(KEYITEM_OBTAINED,TENSHODO_APPLICATION_FORM);
	elseif(player:hasKeyItem(TENSHODO_MEMBERS_CARD) == true) then 
		if(player:sendGuild(0xEC03, 1, 23, 4)) then 
			player:showText(npc,TENSHODO_SHOP_OPEN_DIALOG,514);
		end
	else
		player:messageSpecial(NO_MEMBERSHIP_SHOP_DIALOG); -- I have nothing to sell you.
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
end;