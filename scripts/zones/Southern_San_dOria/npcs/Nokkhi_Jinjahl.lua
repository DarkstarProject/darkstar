-----------------------------------
--  Area: Southern San d'Oria
--   NPC: Nokkhi Jinjahl
--  Type: Travelling Merchant NPC / NPC Quiver Maker / San d'Oria 1st Place
-- @zone: 230
--  @pos 24.829 0.978 -13.110
--  
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local count = trade:getItemCount();
	local carnation	= trade:getItemQty(948)
	----------------ARROWS----------------------------
	local antlion	=	(trade:getItemQty(19195) / 99)
	local beetle	=	(trade:getItemQty(18154) / 99)
	local demon		=	(trade:getItemQty(18159) / 99)
	local gargou	=	(trade:getItemQty(19800) / 99)
	local horn		=	(trade:getItemQty(18156) / 99)
	local irona		=	(trade:getItemQty(17320) / 99)
	local kabura	=	(trade:getItemQty(17325) / 99)
	local ruszor	=	(trade:getItemQty(19182) / 99)
	local scorpion	=	(trade:getItemQty(18155) / 99)
	local silvera	=	(trade:getItemQty(17321) / 99)
	local sleepa	=	(trade:getItemQty(18158) / 99)
	----------------BOLTS-----------------------------
	local acid		=	(trade:getItemQty(18148) / 99)
	local adamana	=	(trade:getItemQty(19801) / 99)
	local blind		=	(trade:getItemQty(18150) / 99)
	local bloody	=	(trade:getItemQty(18151) / 99)
	local darka		=	(trade:getItemQty(19183) / 99)
	local darkling	=	(trade:getItemQty(19196) / 99)
	local darksteel	=	(trade:getItemQty(17338) / 99)
	local fusion	=	(trade:getItemQty(19197) / 99)
	local holy		=	(trade:getItemQty(18153) / 99)
	local mythril	=	(trade:getItemQty(17337) / 99)
	local sleepb	=	(trade:getItemQty(18149) / 99)
	local venom		=	(trade:getItemQty(18152) / 99)
	----------------BULLETS---------------------------
	local adamanb	=	(trade:getItemQty(19803) / 99)
	local bullet	=	(trade:getItemQty(17340) / 99)
	local bronze	=	(trade:getItemQty(17343) / 99)
	local darkb		=	(trade:getItemQty(19184) / 99)
	local dweomer	=	(trade:getItemQty(19198) / 99)
	local ironb		=	(trade:getItemQty(17312) / 99)
	local oberons	=	(trade:getItemQty(19199) / 99)
	local orichalcum=	(trade:getItemQty(19802) / 99)
	local silverb	=	(trade:getItemQty(17341) / 99)
	local steel		=	(trade:getItemQty(18723) / 99)
	local spartan	=	(trade:getItemQty(18160) / 99)
	----------------CARDS-----------------------------
	local fire		=	(trade:getItemQty(2176) / 99)
	local ice		=	(trade:getItemQty(2177) / 99)
	local wind		=	(trade:getItemQty(2178) / 99)
	local earth		=	(trade:getItemQty(2179) / 99)
	local thunder	=	(trade:getItemQty(2180) / 99)
	local water		=	(trade:getItemQty(2181) / 99)
	local light		=	(trade:getItemQty(2182) / 99)
	local dark		=	(trade:getItemQty(2183) / 99)
-----------------------------------------------------
	
	local quiver = (antlion + beetle + demon + gargou + horn + irona + kabura + ruszor + scorpion + silvera + sleepa + acid + adamana + blind + bloody + darka + darkling + darksteel + fusion + holy + mythril + sleepb + venom + adamanb + bullet + bronze + darkb + dweomer + ironb + oberons + orichalcum + silverb + steel + spartan + fire + ice + wind + earth + thunder + water + light + dark)
	if (((quiver * 99) + carnation) == count) then
		if ((quiver == math.floor(quiver)) and (quiver == carnation) and (player:getFreeSlotsCount() >= carnation)) then
			player:tradeComplete();
			----------------ARROWS----------------------------
			if (antlion > 0) then
				player:addItem(5819,antlion);
				player:messageSpecial(ITEM_OBTAINED,5819);
			end
			if (beetle > 0) then
				player:addItem(4221,beetle);
				player:messageSpecial(ITEM_OBTAINED,4221);
			end
			if (demon > 0) then
				player:addItem(4224,demon);
				player:messageSpecial(ITEM_OBTAINED,4224);
			end
			if (gargou > 0) then
				player:addItem(5912,gargouille);
				player:messageSpecial(ITEM_OBTAINED,5912);
			end
			if (horn > 0) then
				player:addItem(4222,horn);
				player:messageSpecial(ITEM_OBTAINED,4222);
			end
			if (irona > 0) then
				player:addItem(4225,irona);
				player:messageSpecial(ITEM_OBTAINED,4225);
			end
			if (kabura > 0) then
				player:addItem(5332,kabura);
				player:messageSpecial(ITEM_OBTAINED,5332);
			end
			if (ruszor > 0) then
				player:addItem(5871,ruszor);
				player:messageSpecial(ITEM_OBTAINED,5871);
			end
			if (scorpion > 0) then
				player:addItem(4223,scorpion);
				player:messageSpecial(ITEM_OBTAINED,4223);
			end
			if (silvera > 0) then
				player:addItem(4226,silvera);
				player:messageSpecial(ITEM_OBTAINED,4226);
			end
			if (sleepa > 0) then
				player:addItem(5333,sleepa);
				player:messageSpecial(ITEM_OBTAINED,5333);
			end
			----------------BOLTS-----------------------------
			if (acid > 0) then
				player:addItem(5335,acid);
				player:messageSpecial(ITEM_OBTAINED,5335);
			end
			if (adamana > 0) then
				player:addItem(5913,adamana);
				player:messageSpecial(ITEM_OBTAINED,5913);
			end
			if (blind > 0) then
				player:addItem(5334,blind);
				player:messageSpecial(ITEM_OBTAINED,5334);
			end
			if (bloody > 0) then
				player:addItem(5339,bloody);
				player:messageSpecial(ITEM_OBTAINED,5339);
			end
			if (darka > 0) then
				player:addItem(5872,darka);
				player:messageSpecial(ITEM_OBTAINED,5872);
			end
			if (darkling > 0) then
				player:addItem(5820,darkling);
				player:messageSpecial(ITEM_OBTAINED,5820);
			end
			if (darksteel > 0) then
				player:addItem(4229,darksteel);
				player:messageSpecial(ITEM_OBTAINED,4229);
			end
			if (fusion > 0) then
				player:addItem(5821,fusion);
				player:messageSpecial(ITEM_OBTAINED,5821);
			end
			if (holy > 0) then
				player:addItem(5336,holy);
				player:messageSpecial(ITEM_OBTAINED,5336);
			end
			if (mythril > 0) then
				player:addItem(4228,mythril);
				player:messageSpecial(ITEM_OBTAINED,4228);
			end
			if (sleepb > 0) then
				player:addItem(5337,sleepb);
				player:messageSpecial(ITEM_OBTAINED,5337);
			end
			if (venom > 0) then
				player:addItem(5338,venom);
				player:messageSpecial(ITEM_OBTAINED,5338);
			end
			----------------BULLETS---------------------------
			if (adamanb > 0) then
				player:addItem(5915,adamanb);
				player:messageSpecial(ITEM_OBTAINED,5915);
			end
			if (bullet > 0) then
				player:addItem(5363,bullet);
				player:messageSpecial(ITEM_OBTAINED,5363);
			end
			if (bronze > 0) then
				player:addItem(5359,bronze);
				player:messageSpecial(ITEM_OBTAINED,5359);
			end
			if (darkb > 0) then
				player:addItem(5873,darkb);
				player:messageSpecial(ITEM_OBTAINED,5873);
			end
			if (dweomer > 0) then
				player:addItem(5822,dweomer);
				player:messageSpecial(ITEM_OBTAINED,5822);
			end
			if (ironb > 0) then
				player:addItem(5353,ironb);
				player:messageSpecial(ITEM_OBTAINED,5353);
			end
			if (oberons > 0) then
				player:addItem(5823,oberons);
				player:messageSpecial(ITEM_OBTAINED,5823);
			end
			if (orichalcum > 0) then
				player:addItem(5914,orichalcum);
				player:messageSpecial(ITEM_OBTAINED,5914);
			end
			if (silverb > 0) then
				player:addItem(5340,silverb);
				player:messageSpecial(ITEM_OBTAINED,5340);
			end
			if (steel > 0) then
				player:addItem(5416,steel);
				player:messageSpecial(ITEM_OBTAINED,5416);
			end
			if (spartan > 0) then
				player:addItem(5341,spartan);
				player:messageSpecial(ITEM_OBTAINED,5341);
			end
			----------------CARDS-----------------------------
			if (fire > 0) then
				player:addItem(5402,fire);
				player:messageSpecial(ITEM_OBTAINED,5402);
			end
			if (ice > 0) then
				player:addItem(5403,ice);
				player:messageSpecial(ITEM_OBTAINED,5403);
			end
			if (wind > 0) then
				player:addItem(5404,wind);
				player:messageSpecial(ITEM_OBTAINED,5404);
			end
			if (earth > 0) then
				player:addItem(5405,earth);
				player:messageSpecial(ITEM_OBTAINED,5405);
			end
			if (thunder > 0) then
				player:addItem(5406,thunder);
				player:messageSpecial(ITEM_OBTAINED,5406);
			end
			if (water > 0) then
				player:addItem(5407,water);
				player:messageSpecial(ITEM_OBTAINED,5407);
			end
			if (light > 0) then
				player:addItem(5408,light);
				player:messageSpecial(ITEM_OBTAINED,5408);
			end
			if (dark > 0) then
				player:addItem(5409,dark);
				player:messageSpecial(ITEM_OBTAINED,5409);
			end
		end
	end
--948	- carnation
--SINGLE--ARROWS----------------STACK
--19195	- antlion arrow		-	5819
--18154	- beetle arrow		-	4221
--18159	- demon arrow		-	4224
--19800	- gargouille arrow	-	5912
--18156	- horn arrow		-	4222
--17320	- iron arrow		-	4225
--17325	- kabura arrow		-	5332
--19182	- ruszor arrow		-	5871
--18155	- scorpion arrow	-	4223
--17321	- silver arrow		-	4226
--18158	- sleep arrow		-	5333
----------BOLTS-----------------------
--18148	- acid bolt			-	5335
--19801	- adaman bolt		-	5913
--18150	- blind bolt		-	5334
--18151	- bloody bolt		-	5339
--19183	- dark adaman bolt	-	5872
--19196	- darkling bolt		-	5820
--17338	- darksteel bolt	-	4229
--19197 - fusion bolt		-	5821
--18153	- holy bolt			-	5336
--17337	- mythril bolt		-	4228
--18149 - sleep bolt 		-	5337
--18152 - venom bolt		-	5338
----------BULLETS---------------------
--19803	- adaman bullet		-	5915	
--17340	- bullet			-	5363
--17343	- bronze bullet		-	5359
--19184	- dark adaman bullet-	5873
--19198	- dweomer bullet	-	5822
--17312	- iron bullet		-	5353
--19199	- oberon's bullet	-	5823
--19802	- orichalcum bullet -	5914
--17341	- silver bullet		-	5340
--18723	- steel bullet		-	5416
--18160	- spartan bullet	-	5341
----------CARDS-----------------------
--2176	- fire card			-	5402
--2177	- ice card			-	5403
--2178	- wind card			-	5404
--2179	- earth card		-	5405
--2180	- thunder card		-	5406
--2181	- water card		-	5407
--2182	- light card		-	5408
--2183	- dark card			-	5409
--------------------------------------
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x02ab,npc:getID());
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

