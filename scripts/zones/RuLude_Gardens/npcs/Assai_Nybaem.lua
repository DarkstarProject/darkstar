-----------------------------------
--	Area: Ru'Lud Gardens
--	NPC:  Assai_Nybaen
--	Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/spoofchat");

-----------------------------------
-- onTrade Text
-----------------------------------
function textRelic1(player,npc,trade)
	player:SpoofChatPlayer( ": ........FFXILegion Custom Trials!........", MESSAGE_ECHO, npc:getID());
end;

function Emperyian1(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Helm of Briareus x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian2(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Carabosses Gem x50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian3(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Fistule Discharge x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian4(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Kukulkan's Fang x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian5(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Ulhuadshi's Fang x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian6(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Itzapalotl's Scale x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian7(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Sobek Skin x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian8(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Cirein-croins Lantern x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian9(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Bukhis Wing x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian10(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Dragua's Scale x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian11(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Orthrus Claws x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian12(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Apademak's Horns x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian13(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Isgebinds Heart x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian14(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Alfards Fang x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian15(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Tanzanite Jewel x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian16(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Two-Leaf Chloris Bud x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian17(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Glavoid Shells x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian18(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Sedna's Tusk x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
function Emperyian19(player,npc,trade)
	player:SpoofChatPlayer( "Objective Collect:... \nCollect Azdaja Horn x 50", MESSAGE_SAY, npc:getID() );
	player:SpoofChatPlayer( "On completion of your trial please ensure you have at least 1 space free in your inventory.", MESSAGE_SAY, npc:getID() );
	player:injectActionPacket(4, 918);
end;
-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
	-----------------------
	--Custom Trial Start
	-----------------------
	if (trade:hasItemQty(3925,50)) and (trade:getItemCount() == 50) then
		player:SpoofChatPlayer( "Well done, I see you have brought me the items I requested, Trade them along with the trial item to my friend here for your reward.", MESSAGE_SAY, npc:getID() );
		player:SpoofChatPlayer( ": Calls Forth the Magian Moogle.", MESSAGE_ECHO, npc:getID() );
		GetNPCByID(17772785):setPos(5,0,-86,166);
		GetNPCByID(17772785):showNPC(100);
		GetNPCByID(17772785):setStatus(STATUS_NORMAL);
		player:injectActionPacket(6, 617);
	end
	if (player:getVar("customtrial") >= 1) and (trade:hasItemQty(3925,50) == false) and (trade:hasItemQty(2184,1) == false) then
		player:SpoofChatPlayer( "Sorry you already have a trial active", MESSAGE_SAY, npc:getID() );
		player:SpoofChatPlayer( "If you wish to cancel the current trial, please trade a small fee of 1x imperial bronze piece to Venessa.", MESSAGE_SAY, npc:getID() );
	end

	-----------------------
	--Emperyian Trial Start --- 80-85
	-----------------------
	if (trade:hasItemQty(19399,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19399;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Almace [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian1(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",152);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19410,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19410;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Armageddon [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian2(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",153);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19400,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19400;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Caldabolg [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian2(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",154);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(18574,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 18574;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Daurdabla [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian1(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",155);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19401,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19401;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Farsha [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian3(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",156);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19407,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19407;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Gambanteinn [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian3(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",157);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19409,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19409;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Gandiva [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian3(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",158);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19408,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19408;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Hvergelmir [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian4(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",159);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19405,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19405;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Kannagi [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian1(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",160);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19406,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19406;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Masamune [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian1(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",160);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(16192,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 16192;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Ochain [80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian4(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",161);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19403,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19403;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Redemption[80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian16(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",162);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19404,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19404;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Rhongomiant[80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian16(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",163);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19398,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19398;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Twashtar[80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian17(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",164);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19402,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19402;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Ukonvasara[80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian17(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",165);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19397,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19397;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Verethragna[80-85]'", MESSAGE_ECHO, npc:getID() );
			Emperyian16(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",166);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end

	-----------------------
	--Emperyian Trial Start --- 85-95
	-----------------------
	if (trade:hasItemQty(19458,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19458;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Almace [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian7(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",167);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19469,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19469;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Armageddon [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian8(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",168);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19459,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19459;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Caldabolg [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian8(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",169);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(18575,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 18575;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Daurdabla [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian7(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",170);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19460,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19460;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Farsha [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian9(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",171);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19466,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19466;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Gambanteinn [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian9(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",172);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19468,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19468;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Gandiva [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian9(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",173);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19467,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19467;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Hvergelmir [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian18(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",174);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19464,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19464;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Kannagi [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian7(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",175);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19465,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19465;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Masamune [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian8(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",176);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(16193,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 16193;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Ochain [85-95] '", MESSAGE_ECHO, npc:getID() );
			Emperyian18(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",177);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19462,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19462;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Redemption [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian5(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",178);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19463,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19463;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Rhongomiant [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian5(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",179);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19457,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19457;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Twashtar [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian6(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",180);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19461,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19461;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Ukonvasara [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian6(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",181);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19456,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19456;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Verethragna [85-95]'", MESSAGE_ECHO, npc:getID() );
			Emperyian5(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",182);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end

		-----------------------
	--Emperyian Trial Start --- 95-99
	-----------------------
	if (trade:hasItemQty(19634,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19634;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Almace [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian12(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",183);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19645,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19645;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Armageddon [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian13(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",184);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19635,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19635;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Caldabolg [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian13(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",185);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(18576,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 18576;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Daurdabla [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian12(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",186);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19636,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19636;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Farsha [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian9(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",187);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19642,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19642;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Gambanteinn [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian9(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",188);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19644,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19644;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Gandiva [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian9(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",189);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19643,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19643;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Hvergelmir [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian19(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",190);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19640,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19640;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Kannagi [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian12(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",191);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19641,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19641;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Masamune [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian13(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",192);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(16194,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 16194;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Ochain [95-99] '", MESSAGE_ECHO, npc:getID() );
			Emperyian19(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",193);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19638,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19638;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Redemption [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian10(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",194);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19639,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19639;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Rhongomiant [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian10(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",195);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19633,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19633;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Twashtar [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian11(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",196);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19637,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19637;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Ukonvasara [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian11(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",197);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
	if (trade:hasItemQty(19632,1) and trade:getItemCount() == 1) and (player:getVar("customtrial") == 0) then
		local ITEM = 19632;
		if (player:getFreeSlotsCount() == 0) then
				player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,ITEM);
		else
			textRelic1(player,npc,trade); -- Generic Legion trial text (see top of page).
			player:SpoofChatPlayer( ": 'Verethragna [95-99]'", MESSAGE_ECHO, npc:getID() );
			Emperyian10(player,npc,trade); -- Text asking to collect Glaviod shells (see top of page).
			player:setVar("customtrial",198);
			player:tradeComplete();
			player:addItem(ITEM);
			player:messageSpecial(ITEM_OBTAINED,ITEM);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	local NPC = 17772760;

	if (player:getVar("TRIAL_COMPLETE") == 1) then
		player:SpoofChatPlayer( "Well done, now trade your item to my friend here for your reward.", MESSAGE_SAY, npc:getID() );
		player:SpoofChatPlayer( ": Calls Forth the Magian Moogle.", MESSAGE_ECHO, npc:getID() );
		GetNPCByID(NPC):setPos(5,0,-86,166);
		GetNPCByID(NPC):showNPC(100);
		GetNPCByID(NPC):setStatus(STATUS_NORMAL);
		player:injectActionPacket(6, 617);
	else
		player:SpoofChatPlayer( "What you looking at?, Try brining me something of interest.", MESSAGE_SAY, npc:getID() );
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
	-- if(csid == 0x2750) then
		-- npc:setAnimation(0);
	-- end
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;



