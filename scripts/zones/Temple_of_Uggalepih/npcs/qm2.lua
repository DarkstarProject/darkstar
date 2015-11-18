-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  ??? (Uggalepih Offering ITEM)
-- @pos 388 0 269 159
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

	respawn = GetServerVariable("[TEMP]Respawn_qm2_for_offering");
	
	if (player:hasItem(1183) == false and player:getFreeSlotsCount() >= 1 and respawn <= os.time(t)) then
		player:addItem(1183);
		player:messageSpecial(ITEM_OBTAINED,1183); -- Uggalepih Offering
		SetServerVariable("[TEMP]Respawn_qm2_for_offering",os.time(t) + 7200); -- 2 hours
		-- ??? dissapears for 2 hours and reappears on new position
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end
	
end;