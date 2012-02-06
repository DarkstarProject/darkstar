-----------------------------------
--	Area: Inner Horutoto Ruins
--	NPC:  Sealed Portal
--  Involved in Quest: Making the Grade
--	Working 50%
--  Notes: Door will open if player has Making the Grade quest active, or if the have the KI portal charm. Door should open when 3 mages stand on circles, but no API for this yet.
--  @zone = 192
--  @pos = -259 -1 -20
-----------------------------------

package.loaded["scripts/zones/Inner_Horutoto_Ruins/TextIDs"] = nil;
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Inner_Horutoto_Ruins/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
 ---- WHM BLM RDM CIRCLE LOCATIONS FOR WHEM API IS AVAILABLE TO QUERY POSITIONS IN ZONE EVERY 3 SECONDS --
 -- if((whmzpos >= -26 and whmzpos <= -22) and (whmxpos <= -261 and whmxpos >= -265))
 -- if((blmzpos >= -26 and blmzpos <= -22) and (blmxpos <= -254 and blmxpos >= -258))
 -- if((rdmzpos >= -31 and rdmzpos <= -27) and (rdmxpos <= -257 and rdmxpos >= -261))
 ----------------------------------------------------------------------------------------------------------

	zpos = player:getZPos();
	if (zpos >= -15) then
		player:messageSpecial(9) -- Portal Does not Open from that side
		return 1;
	else
		if (player:hasKeyItem(PORTAL_CHARM)) then
			return nil;
		elseif (player:getQuestStatus(WINDURST,MAKING_THE_GRADE) == QUEST_ACCEPTED) then
			return nil;
		else
			player:messageSpecial(8)
			return 1;
		end
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



