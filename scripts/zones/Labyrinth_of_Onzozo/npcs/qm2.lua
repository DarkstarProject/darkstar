-----------------------------------
-- Area: Labyrinth of Onzozo
-- NPC:  ??? (qm2)
-- Involved in Quest: Yomi Okuri
-- @pos -176 10 -60 213
-----------------------------------
package.loaded["scripts/zones/Labyrinth_of_Onzozo/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Labyrinth_of_Onzozo/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:hasKeyItem(WASHUS_TASTY_WURST) and player:hasKeyItem(YOMOTSU_FEATHER) == false) then
		if (player:getVar("yomiOkuriKilledNM") >= 1) then
			player:delKeyItem(WASHUS_TASTY_WURST);
			player:addKeyItem(YOMOTSU_FEATHER);
			player:messageSpecial(KEYITEM_OBTAINED,YOMOTSU_FEATHER);
			player:setVar("yomiOkuriKilledNM",0);
		else
			SpawnMob(17649860,300):updateClaim(player); -- Ubume
		end
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
end;