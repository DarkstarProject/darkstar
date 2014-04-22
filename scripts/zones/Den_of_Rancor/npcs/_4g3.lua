-----------------------------------
-- Area: Den of Rancor
-- NPC:  Lantern (SW)
-- @pos -59 45 24 160
-----------------------------------
package.loaded["scripts/zones/Den_of_Rancor/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Den_of_Rancor/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	-- Trade Crimson Rancor Flame
	if(trade:hasItemQty(1139,1) and trade:getItemCount() == 1) then
		sw = os.time() - GetServerVariable("[LANTERN]_rancor_sw_last_lit");
		if(sw <= LANTERNS_STAY_LIT) then
			player:messageSpecial(LANTERN_OFFSET + 7); -- the lantern is already lit
		else
			player:tradeComplete();
			player:addItem(1138); -- Unlit Lantern
			--GetNPCByID(17433045):lightFor(LANTERNS_STAY_LIT); -- Light the lantern for x sec
			SetServerVariable("[LANTERN]_rancor_sw_last_lit",os.time());
			ne = os.time() - GetServerVariable("[LANTERN]_rancor_ne_last_lit");
			nw = os.time() - GetServerVariable("[LANTERN]_rancor_nw_last_lit");
			se = os.time() - GetServerVariable("[LANTERN]_rancor_se_last_lit");
			number_of_lit_lanterns = 1;
			if(ne <= LANTERNS_STAY_LIT) then
				number_of_lit_lanterns = number_of_lit_lanterns + 1;
			end
			if(nw <= LANTERNS_STAY_LIT) then
				number_of_lit_lanterns = number_of_lit_lanterns + 1;
			end
			if(se <= LANTERNS_STAY_LIT) then
				number_of_lit_lanterns = number_of_lit_lanterns + 1;
			end;
			if(number_of_lit_lanterns == 1) then
				player:messageSpecial(LANTERN_OFFSET + 9); -- the first lantern is lit
			elseif(number_of_lit_lanterns == 2) then
				player:messageSpecial(LANTERN_OFFSET + 10); -- the second lantern is lit
			elseif(number_of_lit_lanterns == 3) then
				player:messageSpecial(LANTERN_OFFSET + 11); -- the third lantern is lit
			elseif(number_of_lit_lanterns == 4) then
				player:messageSpecial(LANTERN_OFFSET + 12); -- All the lanterns are lit
				timeGateOpened = math.min(LANTERNS_STAY_LIT - ne,LANTERNS_STAY_LIT - nw,LANTERNS_STAY_LIT - se);
				GetNPCByID(17433051):openDoor(timeGateOpened); -- drop gate to Sacrificial Chamber   
			end;
		end
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	sw = os.time() - GetServerVariable("[LANTERN]_rancor_sw_last_lit");
	if(sw <= LANTERNS_STAY_LIT) then
		player:messageSpecial(LANTERN_OFFSET + 7); -- The lantern is already lit.
	else
		player:messageSpecial(LANTERN_OFFSET + 20); -- The flames of rancor have burned out.
	end
	
	return 0;

end;