-----------------------------------
-- Area: Windurst Walls
-- Door: House of the Hero
-- Involved In Quest: Know One's Onions,
--					  Onion Rings
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/zones/Windurst_Walls/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
   
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

KnowOnesOnionsVar  = player:getVar("KnowOnesOnions");
OnionRingsVar      = player:getVar("OnionRings");
WildCardVar        = player:getVar("WildCard");
JokerCard          = player:hasKeyItem(264);

	if (JokerCard == true) then
		player:startEvent(0x0183,0,264);
	elseif (WildCardVar == 1) then
		player:startEvent(0x0182);
	elseif (OnionRingsVar == 1) then
		player:startEvent(0x0121);
	elseif (KnowOnesOnionsVar == 1) then
		player:startEvent(0x0120,0,4387);
	end
   
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if (csid == 0x0120) then
		player:setVar("KnowOnesOnions",1);
	elseif (csid == 0x0121) then
		player:completeQuest(WINDURST,ONION_RINGS);
		player:addFame(WINDURST,WIN_FAME*100);
		player:setTitle(STAR_ONION_BRIGADIER);
		player:delKeyItem(130);
		player:setVar("OnionRingsTime",0);
		player:setVar("OnionRings",2);
	elseif (csid == 0x0182) then
		player:setVar("WildCard",2);
	elseif (csid == 0x0183) then
		player:delKeyItem(264);
		player:addGil(GIL_RATE*8000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*8000);
	end

end;