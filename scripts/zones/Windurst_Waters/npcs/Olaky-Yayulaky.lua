-----------------------------------
--  Area: Windurst Waters
--   NPC: Olaky-Yayulaky
--  Type: Item Depository
-- @zone: 238
--  @pos -61.247 -4.5 72.551
--
-- Auto-Script: Requires Verification (Verfied By Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Windurst_Waters/TextIDs");
require("scripts/globals/spoofchat");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	-- Retail event missing
	local month = tonumber(os.date("%m"));
	local day = tonumber(os.date("%d"));
	if (month == 5 and day >= 12 and day <= 25) then -- Adventurer Appreciation Campaign (and Mog Bonanza) ~ May 12 - May 25
		local stock_Statues =
		{
			265,     5000,    -- Adamantoise Statue
			266,     5000,    -- Behemoth Statue
			267,     5000,    -- Fafnir Statue
			268,     5000,    -- Nomad Moogle Statue
			269,     5000,    -- Shadow Lord Statue
			270,     5000,    -- Odin Statue
			271,     5000,    -- Alexander Statue
			272,     5000,    -- Ark Angel Hume Statue
			273,     5000,    -- Ark Angel Elvaan Statue
			274,     5000,    -- Ark Angel Tarutaru Statue
			275,     5000,    -- Ark Angel Mithra Statue
			276,     5000,    -- Ark Angel Galka Statue
			277,     5000,    -- Prishe Statue
			278,     5000,    -- Cardian
			279,     5000,    -- Shadow Lord II Statue
			280,     5000,    -- Shadow Lord III Statue
			281,     5000,    -- Atomos Statue
			284,     5000,    -- Goobue Statue
			286,     5000,    -- Nanaa Mihgo Statue
			287,     5000,    -- Nanaa Mihgo II Statue
		};
		showShop(player, STATIC, stock_Statues);
	elseif (month == 8 and day >= 3 and day <= 17) then -- Sunbreeze Festival ~ Aug 3 - Aug 17
		local stock_Swimsuits =
		{
			27805,   7500,    -- Rustic Maillot +1
			28088,   7500,    -- Rustic Trunks +1
			27806,   7500,    -- Shoal Maillot +1
			28089,   7500,    -- Shoal Trunks +1
			14457,   7500,    -- Hume Gilet +1
			15415,   7500,    -- Hume Trunks +1
			14458,   7500,    -- Hume Top +1
			15416,   7500,    -- Hume Shorts +1
			14459,   7500,    -- Elvaan Gilet +1
			15417,   7500,    -- Elvaan Trunks +1
			14460,   7500,    -- Elvaan Top +1
			15418,   7500,    -- Elvaan Shorts +1
			14462,   7500,    -- Mithra Top +1
			15420,   7500,    -- Mithra Shorts +1
			14463,   7500,    -- Galka Gilet +1
			15421,   7500,    -- Galka Trunks +1
			14461,   7500,    -- Tarutaru Maillot +1
			15419,   7500,    -- Tarutaru Trunks +1
			14472,   7500,    -- Tarutaru Top +1
			15424,   7500,    -- Tarutaru Shorts +1
			11273,   7500,    -- Custom Gilet +1
			16329,   7500,    -- Custom Trunks +1
			11274,   7500,    -- Custom Top +1
			16330,   7500,    -- Custom Shorts +1
			11275,   7500,    -- Magna Gilet +1
			16331,   7500,    -- Magna Trunks +1
			11276,   7500,    -- Magna Top +1
			16332,   7500,    -- Magna Shorts +1
			11279,   7500,    -- Savage Top +1
			16335,   7500,    -- Savage Shorts +1
			11280,   7500,    -- Elder Gilet +1
			16336,   7500,    -- Elder Trunks +1
			11277,   7500,    -- Wonder Maillot +1
			16333,   7500,    -- Wonder Trunks +1
			11278,   7500,    -- Wonder Top +1
			16334,   7500,    -- Wonder Shorts +1
		};
		showShop(player, STATIC, stock_Swimsuits);
	else
		player:SpoofChatPlayer( "I don't have special deals to show you right now.", MESSAGE_SAY, npc:getID() );
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	-- player:startEvent(0x038e);
	local month = tonumber(os.date("%m"));
	local day = tonumber(os.date("%d"));
	if ((month == 12 and day >= 10 and day <= 27) ) then -- Starlight Celebration ~ Dec 10 - Dec 27
		local stock_1 =
		{
			15179,   7500,    -- Dream Hat +1
			18864,   7500,    -- Dream Bell +1
			14520,   7500,    -- Dream Robe +1
			10383,   7500,    -- Dream Mittens +1
			11966,   7500,    -- Dream Trousers
			11968,   7500,    -- Dream Pants +1
			15753,   7500,    -- Dream Boots +1
			155,     5000,    -- Dream Sock
			141,     5000,    -- Dream Coffer
			140,     5000,    -- Dream Platter
			86,      6000,    -- San d'Orean Tree
			115,     6000,    -- Bastokan Tree
			116,     6000,    -- Windurstian Tree
			138,     8000,    -- Jeunoan Tree
			5622,    5000,    -- Candy Cane
			5621,    5000,    -- Candy Ring
			5620,    5000,    -- Roast Turkey
		};
		showShop(player, STATIC, stock_1);
	elseif ((month == 12 and day >= 28) or (month == 1 and day <= 15)) then -- Happy New Year ~ Dec 28 - Jan 15
		local stock_2 =
		{
			11491,   8000,    -- Snow Bunny Hat +1
			18846,   7500,    -- Battledore
			10875,   7500,    -- Snowman Cap
			176,     6000,    -- Snowman Knight
			177,     6000,    -- Snowman Miner
			178,     6000,    -- Snowman Mage
			192,     6000,    -- Hoary Spire
			5622,    5000,    -- Candy Cane
			5621,    5000,    -- Candy Ring
			5620,    5000,    -- Roast Turkey
		};
		showShop(player, STATIC, stock_2);
	elseif (month == 2 and day <= 15) then -- Valentione's Day ~ Feb 1 - Feb 15
		local stock_3 =
		{
			18399,   7500,    -- Charm Wand +1
			18845,   7500,    -- Miracle Wand +1
			3654,    6000,    -- Tender Bouquet
			5681,    6000,    -- Cupid chocolate
			5884,    5000,    -- Rengedama
			-- Orb disabled because battlefield is unimplemented. http://wiki.ffxiclopedia.org/wiki/Heroines%E2%80%99_Holdfast
			-- 3557,   25000,    -- Athena Orb
		};
		showShop(player, STATIC, stock_3);
	elseif ((month == 2 and day >= 2) or (month == 3 and day <= 4)) then -- Doll Festival ~ Feb 20 - Mar 4
		local stock_4 =
		{
			180,     5000,    -- Bonbori
			215,     5000,    -- Festival Dolls
			5294,     500,    -- Hume Rice Cake
			5295,     500,    -- Elvaan Rice Cake
			5296,     500,    -- Tarutaru Rice Cake
			5297,     500,    -- Mithra Rice Cake
		};
		showShop(player, STATIC, stock_4);
	elseif (month == 4 and day >= 12 and day <= 26) then -- Egg Hunt Egg-stravaganza ~ Apr 12 - Apr 26
		local stock_5 =
		{
			16109,   7500,    -- Egg Helm
			18166,   7500,    -- Happy Egg
			18167,   7500,    -- Fortune Egg
			18256,   7500,    -- Orphic Egg
			117,     5000,    -- Wing Egg
			118,     5000,    -- Lamp Egg
			119,     5000,    -- Flower Egg
			197,     6000,    -- Clockwork Egg
			196,     6000,    -- Melodious Egg
			199,     6000,    -- Hatchling Egg
			179,     6000,    -- Jeweled Egg
			451,     5000,    -- Egg Stool
			452,     5000,    -- Egg Table
			453,     5000,    -- Egg Locker
			454,     5000,    -- Egg Lantern
			455,     8000,    -- Egg Buffet
		};
		showShop(player, STATIC, stock_5);
	elseif ((month == 4 and day >= 27) or (month == 5 and day <= 10)) then -- Feast of Swords ~ Apr 27 - May 10
		local stock_6 =
		{
			17830,   6000,    -- Wooden Katana
			17831,   7500,    -- Hardwood Katana
			18436,   8000,    -- Lotus Katana
			17748,   6000,    -- Ibushi Shinai
			17749,   7500,    -- Ibushi Shinai +1
			18441,   8000,    -- Shinai
			3641,    6000,    -- Kabuto-kazari
			3642,    6000,    -- Katana-kazari
			5203,     500,    -- Hume Mochi
			5204,     500,    -- Elvaan Mochi
			5205,     500,    -- Tarutaru Mochi
			5206,     500,    -- Galka Mochi
		};
		showShop(player, STATIC, stock_6);
	elseif (month == 5 and day >= 12 and day <= 25) then -- Adventurer Appreciation Campaign (and Mog Bonanza) ~ May 12 - May 25
		local stock_7 =
		{
			18842,   7500,    -- Nomad Moogle Rod
			11355,   7500,    -- Dinner Jacket
			16378,   7500,    -- Dinner Hose
			11853,   7500,    -- Novennial Coat
			11854,   7500,    -- Novennial Dress 
			11956,   7500,    -- Novennial Hose
			11957,   7500,    -- Novennial Boots
			13216,   7500,    -- Gold Moogle Belt
			15297,   7500,    -- Rabbit Belt
			15298,   7500,    -- Worm Belt
			15299,   7500,    -- Mandragora Belt
			5561,     500,    -- Soilent Mog Pie (Made from adventurers who failed their sj quest, by Moogles!)
			-- Todo(disabled till handled):
			-- make sure only one ring per year, else have to drastically jack up price.
			-- 15793,  25000,   -- Anniversary Ring
			-- Disabled because job points are not yet implemented,
			-- and neither is this effect or this item.
			-- 28563,  25000,    -- Vocation Ring
		};
		showShop(player, STATIC, stock_7);
		player:SpoofChatPlayer( "For a small deposit of a 1 gil trade, I can show you our fine selection of hand crafted statues.", MESSAGE_SAY, npc:getID() );
	elseif ((month == 6 and day >= 29) or (month == 7 and day <= 13)) then -- Celestial Nights ~ Jun 29 - Jul 13
		local stock_8 =
		{
			14532,   7500,    -- Otoko Yukata
			14533,   7500,    -- Onago Yukata
			14534,   7500,    -- Otokogimi Yukata
			14535,   7500,    -- Onnagimi Yukata
			4251,     500,    -- Festive Fan
			4252,     500,    -- Summer Fan
			323,     5000,    -- Red Bamboo Grass
			324,     5000,    -- Blue Bamboo Grass
			325,     5000,    -- Green Bamboo Grass
		};
		showShop(player, STATIC, stock_8);
	elseif (month == 8 and day >= 3 and day <= 17) then -- Sunbreeze Festival ~ Aug 3 - Aug 17
		local stock_9 =
		{
			-- Disabled because goldfish scooping is not yet implemented.
			-- 13821,    3750,   -- Lord's Yukata
			-- 13822,    3750,   -- Lady's Yukata
			14532,   5000,    -- Otoko Yukata
			14533,   5000,    -- Onago Yukata
			14534,   7500,    -- Otokogimi Yukata
			14535,   7500,    -- Onnagimi Yukata
			-- Disabled because goldfish scooping is not yet implemented.
			-- 11316,   12500,   -- Otokoeshi Yukata
			-- 11319,   12500,   -- Ominaeshi Yukata
			-- 11861,   15000,   -- Hikogami Yukata
			-- 11862,   15000,   -- Himegami Yukata
			5717,     500,    -- M&P Doner Kebab
			5712,     500,    -- Melon Snowcone
			5709,     500,    -- Cotton Candy
			3676,    9999,    -- Celestial Globe
		};
		showShop(player, STATIC, stock_9);
		player:SpoofChatPlayer( "For a small deposit of a 1 gil trade, I can show you our fine selection of summer swim-wear.", MESSAGE_SAY, npc:getID() );
	elseif ((month == 9 and day >= 28) or (month == 10 and day <= 12)) then -- Blazing Buffaloes ~ Sep 28 - Oct 12
		local stock_10 =
		{
			15455,   2500,    -- Red Sash
			15456,   6000,    -- Dash Sash
			15919,   6000,    -- Drover's Belt
			-- Disabled until effect is edited.
			-- 16243,   7500,    -- Drover's Mantle
			-- 5733,     500,    -- Miracle Milk
			415,     6000,    -- Aldebaran Horn
		};
		showShop(player, STATIC, stock_10);
	elseif ((month == 10 and day >= 17) or (month == 11 and day <= 2)) then --  Harvest Festival ~ Oct 17 - Nov 2
		local stock_11 =
		{
			17565,   2500,    -- Trick Staff
			17566,   2500,    -- Treat Staff
			17587,   5000,    -- Trick Staff II
			17588,   5000,    -- Treat Staff II
			18103,   7500,    -- Pitchfork +1
			16076,   7500,    -- Coven Hat
			13916,   6000,    -- Pumpkin Head
			13917,   6000,    -- Horror Head
			15176,   6000,    -- Pumpkin Head II
			15177,   6000,    -- Horror Head II
			10447,   6000,    -- Pyracmon Cap
			26708,   6000,    -- Flan Mask +1
			458,     6000,    -- Calabazilla Lantern
			203,     6000,    -- Bomb Lantern
			204,     6000,    -- Pumpkin Lantern
			205,     6000,    -- Mandragora Lantern
			3649,    6000,    -- Harvest Horror
			3623,    6000,    -- Djinn Pricket
			3624,    6000,    -- Korrigan Pricket
			3646,    6000,    -- Mandragora Pricket
			3647,    6000,    -- Spook-a-Swirl
			3648,    6000,    -- Chocolate Grumpkin
			4488,    6000,    -- Jack-o'-Lantern
		};
		showShop(player, STATIC, stock_11);
	else
		player:SpoofChatPlayer( "Sorry, I have no wares at this time. We are currently preparing new stock for the next holiday's festivities.", MESSAGE_SAY, npc:getID() );
	end
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