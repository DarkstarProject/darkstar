-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  Monolith
-- @pos <many>
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- Activateur Bleu: 17506746,17506748,17506750,17506752,17506758,17506760,17506766,17506768,17506776
	-- Porte Bleu: 17506719,17506720,17506721,17506722,17506725,17506726,17506731,17506732,17506733,17506735
	-- Activateur Jaune: 17506738,17506740,17506742,17506744,17506762,17506764,17506770,17506772,17506774
	-- Porte Jaune: 17506718,17506717,17506716,17506715,17506727,17506728,17506729,17506730,17506734,17506736
	
	local nID = npc:getID();
--	printf("id: %u", nID);
	GetNPCByID(17506774):setAnimation(1);
	if(nID == 17506746 or nID == 17506748 or nID == 17506750 or nID == 17506752 or nID == 17506758 or 
	   nID == 17506760 or nID == 17506766 or nID == 17506768 or nID == 17506776) then
		GetNPCByID(17506719):setAnimation(8);--blue door
		GetNPCByID(17506720):setAnimation(8);
		GetNPCByID(17506721):setAnimation(8);
		GetNPCByID(17506722):setAnimation(8);
		GetNPCByID(17506725):setAnimation(8);
		GetNPCByID(17506726):setAnimation(8);
		GetNPCByID(17506731):setAnimation(8);
		GetNPCByID(17506732):setAnimation(8);
		GetNPCByID(17506733):setAnimation(8);
		GetNPCByID(17506735):setAnimation(8);
		GetNPCByID(17506718):setAnimation(9);--yellow door
		GetNPCByID(17506717):setAnimation(9);
		GetNPCByID(17506716):setAnimation(9);
		GetNPCByID(17506715):setAnimation(9);
		GetNPCByID(17506727):setAnimation(9);
		GetNPCByID(17506728):setAnimation(9);
		GetNPCByID(17506729):setAnimation(9);
		GetNPCByID(17506730):setAnimation(9);
		GetNPCByID(17506734):setAnimation(9);
		GetNPCByID(17506736):setAnimation(9);
		GetNPCByID(17506745):setAnimation(8);--blue monolith
		GetNPCByID(17506747):setAnimation(8);
		GetNPCByID(17506749):setAnimation(8);
		GetNPCByID(17506751):setAnimation(8);
		GetNPCByID(17506757):setAnimation(8);
		GetNPCByID(17506759):setAnimation(8);
		GetNPCByID(17506765):setAnimation(8);
		GetNPCByID(17506767):setAnimation(8);
		GetNPCByID(17506775):setAnimation(8);
		GetNPCByID(17506737):setAnimation(9);--yellow monolith
		GetNPCByID(17506739):setAnimation(9);
		GetNPCByID(17506741):setAnimation(9);
		GetNPCByID(17506743):setAnimation(9);
		GetNPCByID(17506761):setAnimation(9);
		GetNPCByID(17506763):setAnimation(9);
		GetNPCByID(17506769):setAnimation(9);
		GetNPCByID(17506771):setAnimation(9);
		GetNPCByID(17506773):setAnimation(9);
	else
		GetNPCByID(17506719):setAnimation(9);-- Activateur Jaune: 17506738,17506740,17506742,17506744,17506762,17506764,17506770,17506772,17506774
		GetNPCByID(17506720):setAnimation(9);
		GetNPCByID(17506721):setAnimation(9);
		GetNPCByID(17506722):setAnimation(9);
		GetNPCByID(17506725):setAnimation(9);
		GetNPCByID(17506726):setAnimation(9);
		GetNPCByID(17506731):setAnimation(9);
		GetNPCByID(17506732):setAnimation(9);
		GetNPCByID(17506733):setAnimation(9);
		GetNPCByID(17506735):setAnimation(9);
		GetNPCByID(17506718):setAnimation(8);
		GetNPCByID(17506717):setAnimation(8);
		GetNPCByID(17506716):setAnimation(8);
		GetNPCByID(17506715):setAnimation(8);
		GetNPCByID(17506727):setAnimation(8);
		GetNPCByID(17506728):setAnimation(8);
		GetNPCByID(17506729):setAnimation(8);
		GetNPCByID(17506730):setAnimation(8);
		GetNPCByID(17506734):setAnimation(8);
		GetNPCByID(17506736):setAnimation(8);
		GetNPCByID(17506745):setAnimation(9);--blue monolith
		GetNPCByID(17506747):setAnimation(9);
		GetNPCByID(17506749):setAnimation(9);
		GetNPCByID(17506751):setAnimation(9);
		GetNPCByID(17506757):setAnimation(9);
		GetNPCByID(17506759):setAnimation(9);
		GetNPCByID(17506765):setAnimation(9);
		GetNPCByID(17506767):setAnimation(9);
		GetNPCByID(17506775):setAnimation(9);
		GetNPCByID(17506737):setAnimation(8);--yellow monolith
		GetNPCByID(17506739):setAnimation(8);
		GetNPCByID(17506741):setAnimation(8);
		GetNPCByID(17506743):setAnimation(8);
		GetNPCByID(17506761):setAnimation(8);
		GetNPCByID(17506763):setAnimation(8);
		GetNPCByID(17506769):setAnimation(8);
		GetNPCByID(17506771):setAnimation(8);
		GetNPCByID(17506773):setAnimation(8);
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