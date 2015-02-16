--------------------------------------------------------------
-- func: @heroshop
-- auth: TeoTwawki
-- desc: like @shop, but for accomplished adventurers only
--------------------------------------------------------------

cmdprops =
{
	permission = 4,
	parameters = "i"
}; -- unfinished, will remove this comment and change permission when done


-- Notes:
--
-- ALWAYS comment your additions!


function onTrigger(player,page)

	if (page == 0 or page == nil) then
		player:PrintToPlayer( "Conquer content to unlock new @heroshop pages!");
		player:PrintToPlayer( "1: Nations, 2: Zilart, 3: CoP, 4: ToAU");
		player:PrintToPlayer( "5: WotG, 6: Abyssea, 7: Dynamis, 8: Legion");
		-- player:PrintToPlayer( "9: VoidWatch, 10: Walk of Echoes");
		return
	end

	require("scripts/globals/missions");
	local Sandy_clear = player:hasCompletedMission(SANDORIA,THE_HEIR_TO_THE_LIGHT);
	local Basty_clear = player:hasCompletedMission(BASTOK,WHERE_TWO_PATHS_CONVERGE);
	local Windy_clear = player:hasCompletedMission(WINDURST,MOON_READING);
	local Zilart_clear = player:hasCompletedMission(ZILART,AWAKENING);
	local Chains_clear = player:hasCompletedMission(COP,DAWN);
	local AhtUrgan_clear = player:hasCompletedMission(TOAU,THE_EMPRESS_CROWNED);
	local Goddess_clear = player:hasCompletedMission(WOTG,A_TOKEN_OF_TROTH);
	local Abyssea_clear = player:hasCompletedQuest(ABYSSEA,THE_WYRM_GOD);
	local Dyna_clearA = player:hasKeyItem(HYDRA_CORPS_BATTLE_STANDARD);
	local Dyna_clearB = player:hasKeyItem(DYNAMIS_TAVNAZIA_SLIVER);
	local Legion_clear = player:hasTitle(LEGENDARY_LEGIONNAIRE);

	if ((Sandy_clear == false or Basty_clear == true or Windy_clear == true) and Zilart_clear == true
	and Chains_clear == true and AhtUrgan_clear == true and Goddess_clear == true and Abyssea_clear == true
	and (Dyna_clearA == true or Dyna_clearB == true) and Legion_clear == true)
		player:PrintToPlayer( "Not so fast, Hercules, you have to complete some legendary labors before you can shop here!" );
		return
	end

	if (page == 1) then -- Unlocked by attaining rank 10 in all 3 nations.
		if (Sandy_clear == true and Basty_clear == true and Windy_clear == true) then
			local stock_1 =
			{
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
			};
			showShop(player, STATIC, stock_1);
		end

	elseif (page == 2) then -- Unlocked by completing Rise of the Zilart.
		if (Zilart_clear == true) then
			local stock_2 =
			{
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
			};
			showShop(player, STATIC, stock_2);
		end

	elseif (page == 3) then -- Unlocked by completing Chains of Promathia.
		if (Chains_clear == true) then
			local stock_3 =
			{
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
			};
			showShop(player, STATIC, stock_3);
		end

	elseif (page == 4) then -- Unlocked by completing Treasures of Aht Urgan.
		if (AhtUrgan_clear == true) then
			local stock_4 =
			{
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
			};
			showShop(player, STATIC, stock_4);
		end

	elseif (page == 5) then -- Unlocked by completing Wings of the Goddess.
		if (Goddess_clear == true) then
			local stock_5 =
			{
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
			};
			showShop(player, STATIC, stock_5);
		end

	elseif (page == 6) then -- Unlocked by completing all of Abyssea.
		-- if (player:getVar(MyVariableName) == 1) then
			local stock_6 =
			{
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
			};
			showShop(player, STATIC, stock_6);
		-- end

	elseif (page == 7) then -- Unlocked by clearing every Dynamis zone.
		-- if (player:getVar(MyVariableName) == 1) then
			local stock_7 =
			{
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
			};
			showShop(player, STATIC, stock_7);
		-- end

	elseif (page == 8) then -- Unlocked by clearing every Legion battle.
		-- if (player:getVar(MyVariableName) == 1) then
			local stock_8 =
			{
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
				-- ItemID,    Price,    -- Item Name
			};
			showShop(player, STATIC, stock_8);
		-- end

	else
		player:PrintToPlayer( string.format( "Page %i not found.", page ) );
	end

end;