-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Uggalepih Whistle ITEM)
-- @pos -150 0 -71 159
-----------------------------------
package.loaded["scripts/zones/Temple_of_Uggalepih/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Temple_of_Uggalepih/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	respawn = GetServerVariable("[TEMP]Respawn_qm3_for_whistle");
	
	if (player:hasItem(1184) == false and player:getFreeSlotsCount() >= 1 and respawn <= os.time(t)) then
		player:addItem(1184);
		player:messageSpecial(ITEM_OBTAINED,1184); -- Uggalepih Whistle
		SetServerVariable("[TEMP]Respawn_qm3_for_whistle",os.time(t) + 7200); -- 2 hours
		-- ??? dissapears for 2 hours and reappears on new position
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end
	
end;