-----------------------------------
--  Area: Port Bastok
--   NPC: Ominous Cloud
--  Type: Traveling Merchant NPC
-- @zone: 236
--  @pos 146.962 7.499 -63.316
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Port_Bastok/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Port_Bastok/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	local wijinruit 	=	trade:getItemQty(951)
	local uchitake 	= 	(trade:getItemQty(1161) / 99)
	local tsurara 	= 	(trade:getItemQty(1164) / 99)
	local kawahori 	= 	(trade:getItemQty(1167) / 99)
	local makibishi 	= 	(trade:getItemQty(1170) / 99)
	local hiraishin 	= 	(trade:getItemQty(1173) / 99)
	local mizu 		= 	(trade:getItemQty(1176) / 99)
	local shihei 		= 	(trade:getItemQty(1179) / 99)
	local jusatsu 	=	(trade:getItemQty(1182) / 99)
	local kaginawa	=	(trade:getItemQty(1185) / 99)
	local sairui 		=	(trade:getItemQty(1188) / 99)
	local kodoku 		=	(trade:getItemQty(1191) / 99)
	local shinobi 	=	(trade:getItemQty(1194) / 99)
	local sanjaku		=	(trade:getItemQty(2553) / 99)
	local soushi 		=	(trade:getItemQty(2555) / 99)
	local kabenro 	= 	(trade:getItemQty(2642) / 99)
	local jinko 		= 	(trade:getItemQty(2643) / 99)
	local mokujin 	= 	(trade:getItemQty(2970) / 99)
	local inoshi 		= 	(trade:getItemQty(2971) / 99)
	local shikan 		= 	(trade:getItemQty(2972) / 99)
	local chono 		= 	(trade:getItemQty(2973) / 99)
	local tools = (uchitake + tsurara + kawahori + makibishi + hiraishin + mizu + shihei + jusatsu + kaginawa + sairui + kodoku + shinobi + sanjaku + soushi + kabenro + jinko + mokujin + inoshi + shikan + chono)
	if (((tools * 99) + wijinruit) == trade:getItemCount()) then
		if ((tools == math.floor(tools)) and (tools == wijinruit) and (player:getFreeSlotsCount() >= wijinruit)) then
			player:tradeComplete();
			if (uchitake > 0) then
				player:addItem(5308,uchitake);
				player:messageSpecial(ITEM_OBTAINED,5308);
			end
			if (tsurara > 0) then
				player:addItem(5309,tsurara);
				player:messageSpecial(ITEM_OBTAINED,5309);
			end
			if (kawahori > 0) then
				player:addItem(5310,kawahori);
				player:messageSpecial(ITEM_OBTAINED,5310);
			end
			if (makibishi > 0) then
				player:addItem(5311,makibishi);
				player:messageSpecial(ITEM_OBTAINED,5311);
			end
			if (hiraishin > 0) then
				player:addItem(5312,hiraishin);
				player:messageSpecial(ITEM_OBTAINED,5312);
			end
			if (mizu > 0) then
				player:addItem(5313,mizu);
				player:messageSpecial(ITEM_OBTAINED,5313);
			end
			if (shihei > 0) then
				player:addItem(5314,shihei);
				player:messageSpecial(ITEM_OBTAINED,5314);
			end
			if (jusatsu > 0) then
			    player:addItem(5315,jusatsu);
				player:messageSpecial(ITEM_OBTAINED,5315);
			end
			if (kaginawa > 0) then
				player:addItem(5316,kaginawa);
				player:messageSpecial(ITEM_OBTAINED,5316);
			end
			if (sairui > 0) then
				player:addItem(5317,sairui);
				player:messageSpecial(ITEM_OBTAINED,5317);
			end
			if (kodoku > 0) then
				player:addItem(5318,kodoku);
				player:messageSpecial(ITEM_OBTAINED,5318);
			end
			if (shinobi > 0) then
				player:addItem(5319,shinobi);
				player:messageSpecial(ITEM_OBTAINED,5319);
			end
			if (sanjaku > 0) then
				player:addItem(5417,sanjaku);
				player:messageSpecial(ITEM_OBTAINED,5417);
			end
			if (soushi > 0) then
				player:addItem(5734,soushi);
				player:messageSpecial(ITEM_OBTAINED,5734);
			end
			if (kabenro > 0) then
				player:addItem(5863,kabenro);
				player:messageSpecial(ITEM_OBTAINED,5863);
			end
			if (jinko > 0) then
				player:addItem(5864,jinko);
				player:messageSpecial(ITEM_OBTAINED,5864);
			end
			if (mokujin > 0) then
				player:addItem(5866,mokujin);
				player:messageSpecial(ITEM_OBTAINED,5866);
			end
			if (inoshi > 0) then
				player:addItem(5867,inoshi);
				player:messageSpecial(ITEM_OBTAINED,5867);
			end
			if (shikan > 0) then
				player:addItem(5868,shikan);
				player:messageSpecial(ITEM_OBTAINED,5868);
			end
			if (chono > 0) then
				player:addItem(5869,chono);
				player:messageSpecial(ITEM_OBTAINED,5869);
			end
		end
	end
-- 951 	Wijinruit		
-- 1161	Uchitake		5308
-- 1164	Tsurara			5309
-- 1167	Kawahori-ogi	5310
-- 1170	Makibishi		5311
-- 1173	Hiraishin		5312
-- 1176	Mizu-deppo		5313
-- 1179	Shihei			5314
-- 1182	Jusatsu			5315
-- 1185	Kaginawa		5316
-- 1188	Sairui-ran		5317
-- 1191	Kodoku			5318
-- 1194	Shinobi-tabi	5319
-- 2553	Sanjaku-tengui	5417
-- 2555 Soshi			5734
-- 2642 Kabenro			5863
-- 2643	Jinko			5864
-- 2970	Mokujin			5866
-- 2971 Inoshishinofuda	5867
-- 2972 Shikanofuda		5868
-- 2973	Chonofuda		5869
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
	player:startEvent(0x0159);
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

