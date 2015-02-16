-----------------------------------
--	Area: Ru'Lud Gardens
--	NPC:  Akta
--	Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/spoofchat");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local CUSTOM_TRIAL_ID = player:getVar("CustomTrial");
	-- player:PrintToPlayer(string.format("Custom Trial ID: %u ", CUSTOM_TRIAL_ID));
	-- player:PrintToPlayer(string.format("Trial Status: %u ", player:getVar("TRIAL_COMPLETE")));
	-----------------------
	-- Custom Trial Start
	-----------------------
	if (CUSTOM_TRIAL_ID == 0) then
		-- Imperial Bronze Piece
		if (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
			player:SpoofChatPlayer( "Eh, whats this? I think you have me confused with Venessa.", MESSAGE_SAY, npc:getID() );
		--------------------------------------------
		-- Mythic Trials Start
		--------------------------------------------
		-- Aymur
		elseif (trade:hasItemQty(18999,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( "Aymur [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18999);
		elseif (trade:hasItemQty(19088,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Aymur [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19088);
		elseif (trade:hasItemQty(19718,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Aymur [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19718);
		elseif (trade:hasItemQty(19827,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Aymur [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19827);

		-- Burtgang
		elseif (trade:hasItemQty(18997,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Burtgang [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18997);
		elseif (trade:hasItemQty(19086,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Burtgang [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19086);
		elseif (trade:hasItemQty(19716,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Burtgang [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19716);
		elseif (trade:hasItemQty(19825,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Burtgang [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19825);

		-- Carnwenhan
		elseif (trade:hasItemQty(19000,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Carnwenhan [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 19000);
		elseif (trade:hasItemQty(19089,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Carnwenhan [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19089);
		elseif (trade:hasItemQty(19719,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Carnwenhan [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19719);
		elseif (trade:hasItemQty(19828,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Carnwenhan [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19828);

		-- Conqueror
		elseif (trade:hasItemQty(18991,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Conqueror [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18991);
		elseif (trade:hasItemQty(19080,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Conqueror [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19080);
		elseif (trade:hasItemQty(19710,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Conqueror [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19710);
		elseif (trade:hasItemQty(19819,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Conqueror [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19819);

		-- Death Penalty
		elseif (trade:hasItemQty(19007,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Death Penalty [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 19007);
		elseif (trade:hasItemQty(19096,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Death Penalty [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19096);
		elseif (trade:hasItemQty(19726,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Death Penalty [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19726);
		elseif (trade:hasItemQty(19835,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Death Penalty [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19835);

		-- Gastraphetes
		elseif (trade:hasItemQty(19001,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Gastraphetes [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 19001);
		elseif (trade:hasItemQty(19090,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Gastraphetes [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19090);
		elseif (trade:hasItemQty(19720,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Gastraphetes [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19720);
		elseif (trade:hasItemQty(19829,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Gastraphetes [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19829);

		-- Glanzfaust
		elseif (trade:hasItemQty(18992,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Glanzfaust [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18992);
		elseif (trade:hasItemQty(19081,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Glanzfaust [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19081);
		elseif (trade:hasItemQty(19711,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Glanzfaust [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19711);
		elseif (trade:hasItemQty(19820,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Glanzfaust [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19820);

		-- Kogarasumaru
		elseif (trade:hasItemQty(19002,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Kogarasumaru [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 19002);
		elseif (trade:hasItemQty(19091,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Kogarasumaru [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19091);
		elseif (trade:hasItemQty(19721,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Kogarasumaru [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19721);
		elseif (trade:hasItemQty(19830,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Kogarasumaru [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19830);

		-- Laevateinn
		elseif (trade:hasItemQty(18994,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Laevateinn [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18994);
		elseif (trade:hasItemQty(19803,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Laevateinn [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19803);
		elseif (trade:hasItemQty(19713,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Laevateinn [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19713);
		elseif (trade:hasItemQty(19822,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Laevateinn [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19822);

		-- Liberator
		elseif (trade:hasItemQty(18998,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Liberator [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18998);
		elseif (trade:hasItemQty(19087,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Liberator [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19087);
		elseif (trade:hasItemQty(19717,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Liberator [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19717);
		elseif (trade:hasItemQty(19826,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Liberator [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19826);

		-- Murgleis
		elseif (trade:hasItemQty(18995,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Murgleis [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18995);
		elseif (trade:hasItemQty(19084,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Murgleis [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19084);
		elseif (trade:hasItemQty(19714,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Murgleis [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19714);
		elseif (trade:hasItemQty(19823,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Murgleis [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19823);

		-- Nagi
		elseif (trade:hasItemQty(19003,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Nagi [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 19003);
		elseif (trade:hasItemQty(19092,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Nagi [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19092);
		elseif (trade:hasItemQty(19722,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Nagi [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19722);
		elseif (trade:hasItemQty(19831,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Nagi [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19831);

		-- Nirvana
		elseif (trade:hasItemQty(19005,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Nirvana [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 19005);
		elseif (trade:hasItemQty(19094,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Nirvana [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19094);
		elseif (trade:hasItemQty(19724,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Nirvana [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19724);
		elseif (trade:hasItemQty(19962,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Nirvana [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19962);

		-- Ryunohige
		elseif (trade:hasItemQty(19004,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Ryunohige [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 19004);
		elseif (trade:hasItemQty(19093,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Ryunohige [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19093);
		elseif (trade:hasItemQty(19723,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Ryunohige [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19723);
		elseif (trade:hasItemQty(19832,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Ryunohige [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19832);

		-- Terpsichore
		elseif (trade:hasItemQty(18989,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Terpsichore [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18989);
		elseif (trade:hasItemQty(19098,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Terpsichore [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19098);
		elseif (trade:hasItemQty(19728,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Terpsichore [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19728);
		elseif (trade:hasItemQty(19837,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Terpsichore [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19837);

		-- Tizona
		elseif (trade:hasItemQty(19006,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Tizona [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 19006);
		elseif (trade:hasItemQty(19095,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Tizona [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19095);
		elseif (trade:hasItemQty(19725,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Tizona [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19725);
		elseif (trade:hasItemQty(19834,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Tizona [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19834);

		-- Tupsimati
		elseif (trade:hasItemQty(18990,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Tupsimati [75-85]", MESSAGE_ECHO, npc:getID() );
			textMythic2(player,npc,trade);
			player:setVar("CustomTrial", 18990);
		elseif (trade:hasItemQty(19099,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Tupsimati [85-95]", MESSAGE_ECHO, npc:getID() );
			textMythic3(player,npc,trade);
			player:setVar("CustomTrial", 19099);
		elseif (trade:hasItemQty(19729,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Tupsimati [95-99]", MESSAGE_ECHO, npc:getID() );
			textMythic4(player,npc,trade);
			player:setVar("CustomTrial", 19729);
		elseif (trade:hasItemQty(19838,1) and trade:getItemCount() == 1) then
			textMythic1(player,npc,trade);
			player:SpoofChatPlayer( "Tupsimati [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textMythic5(player,npc,trade);
			player:setVar("CustomTrial", 19838);
		---------------------
		-- End of Mythic Trials
		---------------------
		end
	else
		-- Completed trial via kill counts.
		if (player:getVar("TRIAL_COMPLETE") >= 1) then -- Only triggers if trial active AND done.
			player:SpoofChatPlayer( "Well done, now trade your item to my friend here for your reward.", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "calls forth the Magian Moogle.", MESSAGE_EMOTION, npc:getID() );
			GetNPCByID(npc:getID()+134):setStatus(STATUS_NORMAL);
			player:injectActionPacket(6, 617);

		-- Complete trial via trade
		elseif (trade:hasItemQty(3925,50) and trade:getItemCount() == 50) then
			player:setVar("TRIAL_COMPLETE",2);
			player:SpoofChatPlayer( "Well done, I see you have brought me the items I requested.", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "Trade them along with the trial item to my friend here for your reward.", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "calls forth the Magian Moogle.", MESSAGE_EMOTION, npc:getID() );
			GetNPCByID(npc:getID()+134):setStatus(STATUS_NORMAL);
			player:injectActionPacket(6, 617);

		-- Trial cancellation...
		elseif (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
			player:SpoofChatPlayer( "Eh, whats this? I think you have me confused with Venessa.", MESSAGE_SAY, npc:getID() );
		else -- Trading anything other than expected during an active trial triggers this.
			-- player:PrintToPlayer("Testing else");
			player:SpoofChatPlayer( "Sorry but you already have a trial active.", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "If you wish to cancel the current trial...", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "You'll need to pay Venessa's fee.", MESSAGE_SAY, npc:getID() );
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getVar("TRIAL_COMPLETE") >= 1) then
		player:SpoofChatPlayer( "Well done, now trade your item to my friend here for your reward.", MESSAGE_SAY, npc:getID() );
		player:SpoofChatPlayer( "calls forth the Magian Moogle.", MESSAGE_EMOTION, npc:getID() );
		GetNPCByID(npc:getID()+134):setStatus(STATUS_NORMAL);
		player:injectActionPacket(6, 617);
	else
		player:SpoofChatPlayer( "What you looking at? Try bringing me something of interest.", MESSAGE_SAY, npc:getID() );
	end
end;

-----------------------------------
-- onTrade Texts
-----------------------------------

function textMythic1(player,npc,trade)
	player:SpoofChatPlayer( " ........ FFXILegion Custom Trials ........ ", MESSAGE_ECHO, npc:getID() );
end;

	--[[
	\n indicates a new line in the string, use it like this: "Hi \nHello World", this will look like this in the game,
	Akta: Hi
	Hello World
	or just create a new Spoof Line.

	Note from Teo:
	You can cause a lot of crashes using \n by exceeding message max length or by tripping the message format bug.
	Usually safer to use multiple spoofs instead.
	]]

function textMythic2(player,npc,trade)
	player:injectActionPacket(4, 918);
	player:SpoofChatPlayer( "Objective: Monster slaying.", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Iriz Ima x5", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Velionis x5", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Brass Borer x5", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Zareehkl the Jubilant x5", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Dextrose x5", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Iriri Samariri x5", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 free inventory space.", MESSAGE_ECHO, npc:getID() );
end;

function textMythic3(player,npc,trade)
	player:injectActionPacket(4, 918);
	player:SpoofChatPlayer( "Objective: Monster slaying.", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Achamoth x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Armed Gears x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Nosferatu x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Experimental Lamia x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 free inventory space.", MESSAGE_ECHO, npc:getID() );
end;

function textMythic4(player,npc,trade)
	player:injectActionPacket(4, 918);
	player:SpoofChatPlayer( "Objective: Monster slaying.", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Hydra x3", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Cerberus x3", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Khimara x3", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Gulool Ja Ja x3", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Gurfurlur the Menacing x3", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Medusa x3", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 free inventory space.", MESSAGE_ECHO, npc:getID() );
end;

function textMythic5(player,npc,trade)
	player:injectActionPacket(4, 918);
	player:SpoofChatPlayer( "Objective: Item gathering.", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Bring me 50 Tanzanite Jewels.", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 free inventory space.", MESSAGE_ECHO, npc:getID() );
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
	-- if(csid == 0x2750) then
		-- npc:setAnimation(0);
	-- end
end;