--------------------------------------------------------------
-- func: @shop
-- auth: forgottenandlost
-- desc: opens a custom shop anywhere in the world
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player,page)
    if (page == 0 or page == nil) then
        player:PrintToPlayer( "1: Crystal Depot, 2: MogDonalds, 3:Tool Shop");
    elseif (page == 1) then
        local stock_1 =
        {
            4238,   5000,       -- HQ Fire Crystal
            4239,   5000,       -- HQ Ice Crystal
            4240,   5000,       -- HQ Wind Crystal
            4241,   5000,       -- HQ Earth Crystal
            4242,   5000,       -- HQ Lightning Crystal
            4243,   5000,       -- HQ Water Crystal
            4244,   5000,       -- HQ Light Crystal
            4245,   5000        -- HQ Dark Crystal
        };
        showShop(player, STATIC, stock_1);

    elseif ( page == 2) then -- Would you like fries with that?
        local stock_2 =
        {
            4271,   2499,       -- Rice Dumpling
            4381,   2100,       -- Meat Mithkabob
            4398,   2100,       -- Fish Mithkabob
            4457,   2100,       -- Eel Kabob
            5166,   2100,       -- Coeurl Sub Sandwich
            4355,   1450,       -- Salmon Sub Sandwich
            5686,   799,        -- Cheese Sandwich
            5561,   799,        -- Moogle Pie
            4270,   999,        -- Sweet Rice Cake
            5944,   2000,       -- Frontier Soda
            5932,   1600,       -- Kitron Juice
            4424,   1100,       -- Melon Juice
            4422,   499         -- Orange Juice
        };
        showShop(player, STATIC, stock_2);
	
		
	elseif (page == 3) then
        local stock_3 =
        {
            4181,	1000, 	--instant warp
			4182,	4000, 	--instant reraise
			605,    499,     -- Pickaxe
            1021,   499,     -- Hatchet
            1020,   499,     -- Sickle
            4165,   1000,    -- Silent Oil
            4164,   1000,    -- Prism Powder
            5362,   2000,    -- Rainbow Powder
            5417,   9999,    -- Toolbag (Sanjaku-Tenugui)
            5319,   9999,    -- Toolbag (Shinobi-Tabi)
            5314,   5000,    -- Toolbag (Shihei)
            5867,   20000,   -- Toolbag (Inoshishinofuda)
            5868,   25000,   -- Toolbag (Shikanofuda)
            5869,   25000,   -- Toolbag (Chonofuda)
            1022,   5000     -- Thief's Tools
        };
        showShop(player, STATIC, stock_3);
        player:PrintToPlayer( "Tool shop: Welcome, Kupo!");
	
		
    else
        player:PrintToPlayer( string.format( "Page %i not found.", page ) );
    end
end;