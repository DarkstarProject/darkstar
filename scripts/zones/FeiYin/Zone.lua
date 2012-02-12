-----------------------------------
-- 
-- Zone: FeiYin
-- 
-----------------------------------
package.loaded["scripts/zones/FeiYin/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/FeiYin/TextIDs");

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
	
	cs = -1;
	
	if(prevZone == 111 and player:getQuestStatus(SANDORIA,PIEUJE_S_DECISION) == QUEST_ACCEPTED and player:getVar("pieujesDecisionCS") == 0) then 
		cs = 0x0013;
		player:setVar("pieujesDecisionCS",1);
	elseif(prevZone == 206 and player:getQuestStatus(BASTOK,THE_FIRST_MEETING) == QUEST_ACCEPTED and player:hasKeyItem(LETTER_FROM_DALZAKK) == false) then
		cs = 0x0010;
	end
	
	return cs;
	
end;

-----------------------------------
-- onRegionEnter          
-----------------------------------

function onRegionEnter(player,region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,menuchoice)
--print("CSID: ",csid);
--print("RESULT: ",menuchoice);
	
	if(csid == 0x0010) then
		player:addKeyItem(LETTER_FROM_DALZAKK);
		player:messageSpecial(KEYITEM_OBTAINED,LETTER_FROM_DALZAKK);
	end
	
end;