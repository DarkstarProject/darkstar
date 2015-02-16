-----------------------------------
-- Area: Windurst Waters
-- NPC:  Qhum Knaidjn
-- Guild Merchant NPC: Cooking Guild
-- @pos -111 -2.222 54 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:getGil() == 80000) then
		player:tradeComplete();
		player:addKeyItem(2042);
		player:messageSpecial(KEYITEM_OBTAINED,2042); --patissier
	end
	if ((trade:getGil() == 200000) and player:hasKeyItem(2042) == true) then
		player:tradeComplete();
		player:addKeyItem(2041);
		player:messageSpecial(KEYITEM_OBTAINED,2041); --Noodle Kneeding
	end
	if ((trade:getGil() == 250000) and player:hasKeyItem(2041) and player:hasKeyItem(2042) == true) then
		player:tradeComplete();
		player:addKeyItem(2040);
		player:messageSpecial(KEYITEM_OBTAINED,2040); --Raw Fish Handling
	end
		if ((trade:getGil() == 300000) and player:hasKeyItem(2042) and player:hasKeyItem(2041) and player:hasKeyItem(2040) == true) then
		player:tradeComplete();
		player:addKeyItem(2043);
		player:messageSpecial(KEYITEM_OBTAINED,2043); --Stewpot Mastery
	end
		if ((trade:getGil() == 1000000) and player:hasKeyItem(2042) and player:hasKeyItem(2041) and player:hasKeyItem(2040) and player:hasKeyItem(2043) == true) then
		player:tradeComplete();
		player:addKeyItem(2044);
		player:messageSpecial(KEYITEM_OBTAINED,2044); --way of the culinarian
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	--if (player:sendGuild(5302,5,20,7)) then
		player:showText(npc,CHOMOJINJAHL_SHOP_DIALOG);
	stock = {
    4242,2000,	--Plasma
	4238,2000,	--Inferno
	4239,2000,	--Glacier
	4240,2000,	--Cyclone
	4241,2000,	--Terra
	4243,2000,	--Torrent
	4245,2000,	--Twilight
	4244,2000,	--Aurora
   15050,500000, --Culinarians Gloves
   15451,500000, --Culinarians Belt
   13948,700000, --Chef's Hat
   15826,800000, --Chef's Ring
   -- 3667,500000, --Brass Crock
   14399,1000000, --Culinarian's Apron
    --3328,150000,  --Culinarian's Emblem
	137,1500000,  --Cordon Bleu set
	338,2000000,  --Culinarian's Sign Board
	11336,1000000, --Culinarian's Smock
	3629,2000000, --Culinarian's Stall
 }
	showShop(player, STATIC, stock);
	--end
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
