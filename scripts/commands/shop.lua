--------------------------------------------------------------
-- func: @shop
-- auth: TeoTwawki (aka Forgottenandlost)
-- desc: opens a custom shop anywhere in the world
--------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};


-- Notes:
--
-- ALWAYS comment your additions!


function onTrigger(player,page)
    if (page == 0 or page == nil) then
        player:PrintToPlayer( "1: Crystal Depot, 2: MogDonalds, 3: Meds, 4: Tools and gears");
        -- Edit and uncomment next line if you want more pages.
        -- player:PrintToPlayer( "5: ??, 6: ??, 7: ??, 8: ??");
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
            4245,   5000,       -- HQ Dark Crystal
        };
        showShop(player, STATIC, stock_1);

    elseif (page == 2) then -- Would you like fries with that?
        local stock_2 =
        {
            5610,   60000,      -- Hellsteak +1
            5163,   60000,      -- Plate of Sole Sushi +1
            5765,   60000,      -- Red Curry Bun +1
            5764,   60000,      -- Black Curry Bun +1
            5718,   20000,      -- Cream Puff
        };
        showShop(player, STATIC, stock_2);


    elseif (page == 3) then -- Medicine chest.
        local stock_3 =
        {
            4148,   316,    -- Antidote
            4150,   2595,   -- Eye Drops
            4151,   800,    -- Echo drops
            4112,   910,    -- Potion
            4128,   4832,   -- Ether
			21335,   1000,  -- Titanium Bullet
			21305,   1000,  -- Tulfaire Arrow
        };
        showShop(player, STATIC, stock_3);

    elseif (page == 4) then -- Tools and gears.
        local stock_4 =
        {
            16368,    80000, -- Herder's Subligar
            18762,    80000, -- Custodes
            18503,    80000, -- Mammut
            19222,    80000, -- Wurger
            15880,    80000, -- Key Ring Belt
            19223,    60000, -- Attar of Roses
            16007,    60000, -- Protect Earing
            15835,    50000, -- Desperado Ring
            19157,    50000, -- Surviver
            15926,    50000, -- Bronze Bandolier
            19221,    50000, -- Firefly
            15834,    50000, -- Bind Ring
            16279,    40000, -- Pile Chain
        };
        showShop(player, STATIC, stock_4);

    else
        player:PrintToPlayer( string.format( "Page %i not found.", page ) );
    end
end;