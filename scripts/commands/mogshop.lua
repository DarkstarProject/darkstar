--------------------------------------------------------------
-- func: @mogshop <page number>
-- auth: forgottenandlost
-- desc: opens the custom moogle shop menu anywhere in the world
--------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player,page)
    if (page == 0 or page == nil) then
        player:PrintToPlayer( "1: Crystal Depot, 2: Pharmacy, 3: MogDonalds");
        player:PrintToPlayer( "4: Tools, 5: National Hero Specials, 6: Mighty Hero Specials");
        player:PrintToPlayer( "7: Chains-Breaker Specials");
    elseif (page == 1) then -- HQ Crystals
        local stock_1 =
        {
            4238,   5000,   -- HQ Fire Crystal
            4239,   5000,   -- HQ Ice Crystal
            4240,   5000,   -- HQ Wind Crystal
            4241,   5000,   -- HQ Earth Crystal
            4242,   5000,   -- HQ Lightning Crystal
            4243,   5000,   -- HQ Water Crystal
            4244,   5000,   -- HQ Light Crystal
            4245,   5000    -- HQ Dark Crystal
        };
        showShop(player, STATIC, stock_1);
        player:PrintToPlayer( "Crystal Depot: Welcome, Kupo!");
    elseif (page == 2) then -- Pharmacy
        local stock_2 =
        {
            4148,   450,     -- Antidote
            4154,   1000,    -- Holy Water
            4150,   2000,    -- Eye Drops
            4151,   2000,    -- Echo Drops
            4153,   2000,    -- Bottle of Antacid
            5418,   2000,    -- Tincture
            5328,   2000,    -- Hi-Potion Drop
            5358,   2000,    -- Hi-Ether Drop
            5356,   5000,    -- Remedy Ointment
            4202,   25000,   -- Daedalus Wing
            5876,   25000,   -- Petrify Screen
            5877,   25000,   -- Terror Screen
            5878,   25000,   -- Amnesia Screen
            5879,   25000,   -- Doom Screen
            5880,   25000    -- Poison Screen
        };
        showShop(player, STATIC, stock_2);
        player:PrintToPlayer( "Pharmacy: Welcome, Kupo!");
    elseif (page == 3) then -- MogDonalds
        local stock_3 =
        {
            4271,   2499,   -- Rice Dumpling
            4381,   2100,   -- Meat Mithkabob
            4398,   2100,   -- Fish Mithkabob
            4457,   2100,   -- Eel Kabob
            5166,   2100,   -- Coeurl Sub Sandwich
            4355,   1450,   -- Salmon Sub Sandwich
            5686,   799,    -- Cheese Sandwich
            5561,   799,    -- Moogle Pie
            4270,   999,    -- Sweet Rice Cake
            5944,   2000,   -- Frontier Soda
            5932,   1600,   -- Kitron Juice
            4424,   1100,   -- Melon Juice
            4422,   499     -- Orange Juice
        };
        showShop(player, STATIC, stock_3);
        player:PrintToPlayer( "MogDonalds: Welcome, Kupo!");
    elseif (page == 4) then
        local stock_4 =
        {
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
        showShop(player, STATIC, stock_4);
        player:PrintToPlayer( "Tool shop: Welcome, Kupo!");
    elseif (page == 5) then -- National Hero Specials
        local S_clear = player:hasCompletedMission(SANDORIA,THE_HEIR_TO_THE_LIGHT);
        local B_clear = player:hasCompletedMission(BASTOK,WHERE_TWO_PATHS_CONVERGE);
        local W_clear = player:hasCompletedMission(WINDURST,MOON_READING);
        if (S_clear == true and B_clear == true and W_clear == true) then
            local stock_5a =
            {
                5717,   1,        -- M&P Doner Kebab
                5639,   5000,     -- M&P Chicken
                5640,   5000,     -- M&P Cracker
                5641,   5000,     -- M&P Dumpling
                265,    10000,    -- Adamantoise Statue
                266,    10000,    -- Behemoth Statue
                267,    10000,    -- Fafnir Statue
                268,    10000,    -- Nomad Moogle Statue
                269,    10000,    -- Shadow Lord Statue
                1255,   500000,   -- Fire Ore
                1256,   500000,   -- Ice Ore
                1257,   500000,   -- Wind Ore
                1258,   500000,   -- Earth Ore
                1259,   500000,   -- Lightning Ore
                1260,   500000,   -- Water Ore
            };
            showShop(player, STATIC, stock_5a);
            player:PrintToPlayer( "National Hero Specials: Welcome, Kupo!");
        elseif (S_clear == true or B_clear == true or W_clear == true) then
            local stock_5b =
            {
                5717,   1,       -- M&P Doner Kebab
                5639,   5000,    -- M&P Chicken
                5640,   5000,    -- M&P Cracker
                5641,   5000,    -- M&P Dumpling
                268,    10000,   -- Nomad Moogle Statue
                269,    10000,   -- Shadow Lord Statue
            };
            showShop(player, STATIC, stock_5b);
            player:PrintToPlayer( "National Hero Specials: Welcome, Kupo!");
        elseif (player:getRank() >= 5) then
            local stock_5c =
            {
                5717,   1,       -- M&P Doner Kebab
                268,    10000,   -- Nomad Moogle Statue
            };
            showShop(player, STATIC, stock_5c);
            player:PrintToPlayer( "There isn't much in stock for low rank adventurers, Kupo!");
        else
            player:PrintToPlayer( "You need a higher rank to unlock this, Kupo!");
        end
    elseif (page == 6) then -- Mighty Hero Specials
        if (player:hasCompletedMission(ZILART,AWAKENING) == true) then
            local stock_6 =
            {
                272,    20000,    -- Ark Angel HM. Statue
                273,    20000,    -- Ark Angel EV. Statue
                274,    20000,    -- Ark Angel TT. Statue
                275,    20000,    -- Ark Angel MR. Statue
                276,    20000,    -- Ark Angel GK. Statue
                18912,  20000,    -- Ark Saber
                18913,  20000,    -- Ark Sword
                18563,  20000,    -- Ark Scythe
                18545,  20000,    -- Ark Tabar
                18464,  20000,    -- Ark Tachi
                1550,   50000,    -- Ark Pentasphere
                1261,   500000    -- Light Ore
            };
            showShop(player, STATIC, stock_6);
            player:PrintToPlayer( "Mighty Hero Specials: Welcome, Kupo!");
        else
            player:PrintToPlayer( "Clear 'Rise of the Zilart' to unlock this, Kupo!");
        end
    elseif (page == 7) then -- Chains-Breaker Specials
        if (player:hasCompletedMission(COP,DAWN) == true) then
            local stock_7 =
            {
                14657,  20000,    -- Ducal Guard's Ring
                1262,   500000,   -- Dark Ore
            };
            showShop(player, STATIC, stock_7);
            player:PrintToPlayer( "Chains-Breaker Specials: Welcome, Kupo!");
        else
            player:PrintToPlayer( "Clear 'Chains of Promathia' to unlock this, Kupo!");
        end
    else
        -- local Mog = 16982044;
        -- message = "Test!";
        -- SpoofSay(Mog,player:getID(),message);
        player:PrintToPlayer( string.format( "The MogShop catalog doesn't have a page %i, Kupo!", page ) );
    end
end;