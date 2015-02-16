-----------------------------------
--	Area: Ru'Lud Gardens
--	NPC:  Venessa
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
			player:SpoofChatPlayer( "I cannot accept that right now, you do not have an active trial.", MESSAGE_SAY, npc:getID() );
		---------------------
		-- Relic Trials Start
		---------------------
		-- Amanomurakumo
		elseif (trade:hasItemQty(18318,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Amanomurakumo [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18318);
		elseif (trade:hasItemQty(18646,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Amanomurakumo [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18646);
		elseif (trade:hasItemQty(18674,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Amanomurakumo [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18674);
		elseif (trade:hasItemQty(19755,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Amanomurakumo [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19755);

		-- Aegis
		elseif (trade:hasItemQty(15070,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Aegis [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 15070);
		elseif (trade:hasItemQty(16196,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Aegis [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 16196);
		elseif (trade:hasItemQty(16198,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Aegis [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 16198);
		elseif (trade:hasItemQty(11927,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Aegis [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 11927);

		-- Annihilator
		elseif (trade:hasItemQty(18336,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Annihilator [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18336);
		elseif (trade:hasItemQty(18649,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Annihilator [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18649);
		elseif (trade:hasItemQty(18677,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Annihilator [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18677);
		elseif (trade:hasItemQty(19758,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Annihilator [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19758);

		-- Apocalypse
		elseif (trade:hasItemQty(18306,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Apocalypse [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18306);
		elseif (trade:hasItemQty(18644,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Apocalypse [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18644);
		elseif (trade:hasItemQty(18672,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Apocalypse [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18672);
		elseif (trade:hasItemQty(19753,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Apocalypse [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19753);

		-- Bravura
		elseif (trade:hasItemQty(18294,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Bravura [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18294);
		elseif (trade:hasItemQty(18642,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Bravura [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18642);
		elseif (trade:hasItemQty(18670,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Bravura [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18670);
		elseif (trade:hasItemQty(19751,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Bravura [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19751);

		-- Claustrum
		elseif (trade:hasItemQty(18330,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Claustrum [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18330);
		elseif (trade:hasItemQty(18648,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Claustrum [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18648);
		elseif (trade:hasItemQty(18676,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Claustrum [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18676);
		elseif (trade:hasItemQty(19757,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Claustrum [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19757);

		-- Excalibur
		elseif (trade:hasItemQty(18276,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Excalibur [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18276);
		elseif (trade:hasItemQty(18639,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Excalibur [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18639);
		elseif (trade:hasItemQty(18667,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Excalibur [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18667);
		elseif (trade:hasItemQty(19748,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Excalibur [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19748);

		-- Gjallarhorn
		elseif (trade:hasItemQty(18342,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Gjallarhorn [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18342);
		elseif (trade:hasItemQty(18578,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Gjallarhorn [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18578);
		elseif (trade:hasItemQty(18580,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Gjallarhorn [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18580);
		elseif (trade:hasItemQty(18572,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Gjallarhorn [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 18572);

		-- Gungnir
		elseif (trade:hasItemQty(18300,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Gungnir [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18300);
		elseif (trade:hasItemQty(18643,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Gungnir [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18643);
		elseif (trade:hasItemQty(18671,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Gungnir [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18671);
		elseif (trade:hasItemQty(19752,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Gungnir [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19752);

		-- Guttler
		elseif (trade:hasItemQty(18288,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Guttler [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18288);
		elseif (trade:hasItemQty(18641,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Guttler [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18641);
		elseif (trade:hasItemQty(18669,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Guttler [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18669);
		elseif (trade:hasItemQty(19750,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Guttler [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19750);

		-- Kikoku
		elseif (trade:hasItemQty(18312,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Kikoku [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18312);
		elseif (trade:hasItemQty(18645,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Kikoku [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18645);
		elseif (trade:hasItemQty(18673,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Kikoku [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18673);
		elseif (trade:hasItemQty(19754,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Kikoku [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19754);

		-- Mandau
		elseif (trade:hasItemQty(18270,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Mandau [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18270);
		elseif (trade:hasItemQty(18638,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Mandau [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18638);
		elseif (trade:hasItemQty(18666,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Mandau [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18666);
		elseif (trade:hasItemQty(19747,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Mandau [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19747);

		-- Mjollnir
		elseif (trade:hasItemQty(18324,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Mjollnir [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18324);
		elseif (trade:hasItemQty(18647,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Mjollnir [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18647);
		elseif (trade:hasItemQty(18675,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Mjollnir [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18675);
		elseif (trade:hasItemQty(19756,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Mjollnir [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19756);

		-- Ragnarok
		elseif (trade:hasItemQty(18282,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Ragnarok [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18282);
		elseif (trade:hasItemQty(18640,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Ragnarok [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18640);
		elseif (trade:hasItemQty(18668,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Ragnarok [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18668);
		elseif (trade:hasItemQty(19749,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Ragnarok [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19749);

		-- Spharai
		elseif (trade:hasItemQty(18264,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Spharai [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18264);
		elseif (trade:hasItemQty(18637,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Spharai [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18637);
		elseif (trade:hasItemQty(18665,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Spharai [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18665);
		elseif (trade:hasItemQty(19746,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Spharai [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19746);

		-- Yoichinoyumi
		elseif (trade:hasItemQty(18348,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Yoichinoyumi [75-85]", MESSAGE_ECHO, npc:getID() );
			textRelic2(player,npc,trade);
			player:setVar("CustomTrial", 18348);
		elseif (trade:hasItemQty(18650,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Yoichinoyumi [85-95]", MESSAGE_ECHO, npc:getID() );
			textRelic3(player,npc,trade);
			player:setVar("CustomTrial", 18650);
		elseif (trade:hasItemQty(18678,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Yoichinoyumi [95-99]", MESSAGE_ECHO, npc:getID() );
			textRelic4(player,npc,trade);
			player:setVar("CustomTrial", 18678);
		elseif (trade:hasItemQty(19759,1) and trade:getItemCount() == 1) then
			textRelic1(player,npc,trade);
			player:SpoofChatPlayer( "Yoichinoyumi [99-99+4]", MESSAGE_ECHO, npc:getID() );
			textRelic5(player,npc,trade);
			player:setVar("CustomTrial", 19759);
		---------------------
		-- End of Relic Trials
		---------------------
		end
	else
		-- Completed trial via kill counts.
		if (player:getVar("TRIAL_COMPLETE") >= 1) then -- Only triggers if trial active AND done.
			player:SpoofChatPlayer( "Well done, now trade your item to my friend here for your reward.", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "calls forth the Magian Moogle.", MESSAGE_EMOTION, npc:getID() );
			GetNPCByID(npc:getID()+1):setStatus(STATUS_NORMAL);
			player:injectActionPacket(6, 617);

		-- Complete trial via trade
		elseif (trade:hasItemQty(3925,50) and trade:getItemCount() == 50) then
			player:setVar("TRIAL_COMPLETE",2);
			player:SpoofChatPlayer( "Well done, I see you have brought me the items I requested.", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "Trade them along with the trial item to my friend here for your reward.", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "calls forth the Magian Moogle.", MESSAGE_EMOTION, npc:getID() );
			GetNPCByID(npc:getID()+1):setStatus(STATUS_NORMAL);
			player:injectActionPacket(6, 617);

		-- Trial cancellation...
		elseif (trade:hasItemQty(2184,1) and trade:getItemCount() == 1) then
			-- player:PrintToPlayer("Testing Cancellation");
			player:setVar("CustomTrial", 0);
			player:setVar("Seww_the_Squidlimbed_KILLS",0);
			player:setVar("Mischievous_Micholas_KILLS",0);
			player:setVar("Keeper_of_Halidom_KILLS",0);
			player:setVar("Megalobugard_KILLS",0);
			player:setVar("Dune_Widow_KILLS",0);
			player:setVar("Intulo_KILLS",0);
			player:setVar("Adamantoise_KILLS",0);
			player:setVar("Behemoth_KILLS",0);
			player:setVar("Fafnir_KILLS",0);
			player:setVar("Juggler_Hecatomb_KILLS",0);
			player:setVar("Nidhogg_KILLS",0);
			player:setVar("King_Behemoth_KILLS",0);
			player:setVar("Aspidochelone_KILLS",0);
			player:setVar("Ash_Dragon_KILLS",0);
			player:SpoofChatPlayer( "Ok your trial has been canceled.", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "You can now begin a new trial.", MESSAGE_SAY, npc:getID() );
			player:tradeComplete();
		else -- Trading anything other than expected during an active trial triggers this.
			-- player:PrintToPlayer("Testing else");
			player:SpoofChatPlayer( "If you wish to cancel your current trial...", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "The fee for wasting my time is:", MESSAGE_SAY, npc:getID() );
			player:SpoofChatPlayer( "1 Imperial Bronze Piece. ", MESSAGE_ECHO, npc:getID() );
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getVar("TRIAL_COMPLETE") >= 1) then -- Only triggers if trial active AND done.
		player:SpoofChatPlayer( "Well done, now trade your item to my friend here for your reward.", MESSAGE_SAY, npc:getID() );
		player:SpoofChatPlayer( "calls forth the Magian Moogle.", MESSAGE_EMOTION, npc:getID() );
		GetNPCByID(npc:getID()+1):setStatus(STATUS_NORMAL);
		player:injectActionPacket(6, 617);
	else
		player:startEvent(0x2750);
	end
end;

-----------------------------------
-- onTrade Texts
-----------------------------------

function textRelic1(player,npc,trade)
	player:SpoofChatPlayer( " ........ FFXILegion Custom Trials ........ ", MESSAGE_ECHO, npc:getID() );
end;

function textRelic2(player,npc,trade)
	player:injectActionPacket(4, 918);
	player:SpoofChatPlayer( "Objective: Monster slaying.", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Dune Widow x3", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Intulo x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Megalobugard x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Seww the Squidlimbed x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Mischievous Micholas x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Keeper of Halidom x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 free inventory space.", MESSAGE_ECHO, npc:getID() );
end;

function textRelic3(player,npc,trade)
	player:injectActionPacket(4, 918);
	player:SpoofChatPlayer( "Objective: Monster slaying.", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Fafnir x7", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Adamantoise x7", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Behemoth x7", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 free inventory space.", MESSAGE_ECHO, npc:getID() );
end;

function textRelic4(player,npc,trade)
	player:injectActionPacket(4, 918);
	player:SpoofChatPlayer( "Objective: Monster slaying.", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Juggler Hecatomb x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Ash Dragon x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Nidhogg x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "King Behemoth x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "Aspidochelone x4", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 free inventory space.", MESSAGE_ECHO, npc:getID() );
end;

function textRelic5(player,npc,trade)
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