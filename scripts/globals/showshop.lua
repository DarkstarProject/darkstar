-----------------------------------
--	[Command name]: @shop
--	[Author      ]: forgottenandlost
--	[Description ]: opens a custom shop anywhere in the world just to see if we can
-----------------------------------

---------------------------------------------------------
-- begin copy pasta, mm, we love pasta!...
-- ...Should change these later to something like:
-- require("scripts/globals/shop");
----------------------
SANDORIA = 0;
  BASTOK = 1;
WINDURST = 2;
  KAZHAM = 2;
   JEUNO = 3;
 SELBINA = 4;
   RABAO = 4;
    NORG = 5;
TAVNAZIA = 6;
  STATIC = 7;

-----------------------------------
-- function showShop
--
-- Total stock cuts off after 16 items.
-- If you add more than that the extras won't display.
-----------------------------------

function showShop(player, nation, stock)

correction = 1;

	if (nation ~= STATIC) then
		correction = (1 + (0.20 * (9 - player:getFameLevel(nation)) / 8))*SHOP_PRICE;
	end

player:createShop(nation);

	for i = 1, #stock, 2 do
		player:addShopItem(stock[i],stock[i+1]*correction);
	end

player:sendMenu(2);
end;

-----------------------------------
-- function NationShop
--
-- Total stock cuts off after 16 items.
-- If you add more than that the extras won't display.
-----------------------------------

function showNationShop(player, nation, stock)

conquest = getNationRank(nation);
playerNation = player:getNation();

correction = 1;

	if (nation ~= STATIC) then
		correction = (1 + (0.20 * (9 - player:getFameLevel(nation)) / 8))*SHOP_PRICE;
	end

player:createShop(nation);

	for i = 1, #stock, 3 do
		if (stock[i+2] == 1) then
			if (playerNation == nation and conquest == 1) then
				player:addShopItem(stock[i],stock[i+1]*correction);
			end
		elseif (stock[i+2] == 2) then
			if (conquest <= 2) then
				player:addShopItem(stock[i],stock[i+1]*correction);
			end
		else
			player:addShopItem(stock[i],stock[i+1]*correction);
		end
	end

player:sendMenu(2);
end;

-----------------------------------
-- function OPVendorShop
-- creates the usual OP vendor store
-- {ItemID,Price}
-----------------------------------

function showOPVendorShop(player)

	stock =
	{
		0x1034,316,		--Antidote
		0x1037,800,		--Echo Drops
		0x1020,4832,	--Ether
		0x1036,2595,	--Eye Drops
		0x1010,910		--Potion
	};

	showShop(player, STATIC, stock);

end;
----------------------
-- End of copy pasta.
---------------------------------------------------------
function onTrigger(player,npc)
	-- lets see if this works!
	-- If it does we can replace these entries and add up to 8 more
    stock = {
        5718,  10000,   -- Cream Puff +17 int
		4363,   6000,   -- faerie apple
		5163,  25000,   -- Sole Sushi + 1 2000hp+
	    --4238,	1000,	-- fire
	    --4239,	1000,	-- ice
	    --4240,	1000,	-- wind
	    --4241,	1000,	-- earth
	    --4242,	1000,	-- lightning
	    --4243,	1000,	-- water
	    --4244,	1000,	-- light
	    --4245,	1000,	-- dark
	   15763,  10000,   -- Emperor Band

    }

	showShop(player, STATIC, stock);

end;
