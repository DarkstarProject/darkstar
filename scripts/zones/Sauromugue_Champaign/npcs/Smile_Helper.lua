-----------------------------------
--  Area: East Ronfaure
--  NPC: Smile Helper
--  Type: EVENT NPC 
--  Scripted/Created by Tagban
--  REQUIRES PrintToServer/PrintToPlayer mod posted on DSP Forums
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/East_Ronfaure/TextIDs");

-----------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
-- Begin sex finder
local race = player:getRace();
local sex = "NO";
    switch(race) : caseof
    {
        [1] = function (x) -- H.Male
			sex = "male";
        end,
        [2] = function (x) -- H.Female
			sex = "female";
        end,
        [3] = function (x)
			sex = "male"; -- E.Male
        end,
        [4] = function (x) -- E.Female
			sex = "female";
        end,
        [5] = function (x) -- T.Male
			sex = "male";
        end,
        [6] = function (x) -- T.Female
			sex = "female";
        end,
        [7] = function (x) -- Mithra F
			sex = "female";
        end,
        [8] = function (x) -- Galka
			sex = "male";
        end,

        default = function (x) end,
    }
	-- End Sex Finder
	if trade:hasItemQty(4216,1) then
		itemId = 18863; -- Dream Bell
		quantity = 1;
		player:PrintToPlayer("Smile Helper : Here is your first clue!", 0x1F);
		player:PrintToPlayer("Smile Helper : Take this item to the galka in the desert that is dancing..", 0x1F);
		player:tradeComplete();
		player:addItem(itemId);
		player:PrintToPlayer("You obtained the Dream bell.", 0xF);
		-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 4216
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		-- Part 2 (BOOTS QUEST)
	elseif trade:hasItemQty(18864,1) then -- Bell +1 Do you have it?
		itemId = 15752; -- Dream Boots
		quantity = 1;
		player:PrintToPlayer("Smile Helper : Time for the second quest!", 0x1F);
		player:PrintToPlayer("Smile Helper : There's a mithra feeding fish near the water.. she needs shoes!", 0x1F);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Boots.", 0xF);
		-- PART 3 Boots to HAT
	elseif trade:hasItemQty(15753,1) then -- Boots +1 Do you got it?
		itemId = 15178; -- Dream Hat
		quantity = 1;
		player:PrintToPlayer("Smile Helper : Awesome! Did she like her boots?", 0x1F);
		player:PrintToPlayer("Smile Helper : Well, I know another tarutaru that needs a new hat.", 0x1F);
		player:PrintToPlayer("Smile Helper : He is staying at the Bat's Lair in Bastok, go make his day!", 0x1F);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Hat.", 0xF);
	elseif trade:hasItemQty(15179,1) then -- Hat +1 Do you have it?
		itemId = 10382; -- Dream Mittens
		quantity = 1;
		player:PrintToPlayer("Smile Helper : Wow! Thats a really nice new hat.", 0x1F);
		player:PrintToPlayer("Smile Helper : This reminds me of a story I heard a while ago...", 0x1F);
		player:PrintToPlayer("Smile Helper : There was an elvaan named Claus. He had a hat like that...", 0x1F);
		player:PrintToPlayer("Smile Helper : He was from the past, and liked to spend time near a magical tree in the glacier.", 0x1F);
		player:PrintToPlayer("Smile Helper : Now the tree is alone..", 0x1F);
		player:PrintToPlayer("Smile Helper : Its said if you hang some mittens on the tree it will enhance them. Go find it!", 0x1F);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Mittens.", 0xF);
	elseif trade:hasItemQty(10383,1) then -- Mittens +1 Do you have it?
    switch(sex) : caseof
    {
        ["NO"] = function (x) -- Broken
			player:PrintToPlayer("Broken, tell Tagban.");
        end,
		["male"] = function (x)
			itemId = 11965; -- Male Trousers (NQ)
        end,
		["female"] = function (x) -- Broken
			itemId = 11967; -- Female Pants (NQ)
        end,

        default  = function (x) end,
    }
				quantity = 1;
				player:PrintToPlayer("Smile Helper : The tree enhanced your mittens?", 0x1F);
				player:PrintToPlayer("Smile Helper : See there is a magic in starlight...", 0x1F);
				player:PrintToPlayer("Smile Helper : You can have these pants, there is a weather watcher above a weaver's guild that can", 0x1F);
				player:PrintToPlayer("Smile Helper : enhance these for you... Their name starts with a Wa... Er.. I believe..", 0x1F);
				player:addItem(itemId, quantity);
				player:PrintToPlayer("<You have obtained the Dream Pants or Trousers...>", 0xF)		;
	elseif trade:hasItemQty(11968,1) or trade:hasItemQty(11966,1) then -- Pants FEMALE
				player:PrintToPlayer("Smile Helper : You got them! Wow you know you're starting to look like Claus more now..", 0x1F);
				player:PrintToPlayer("Smile Helper : There was a story of that magical Elvaan that he was killed a long time ago..", 0x1F);
				player:PrintToPlayer("Smile Helper : The beasts ate him and his kin, and are now all extinct, but they used to live", 0x1F);
				player:PrintToPlayer("Smile Helper : in the B.Glacier.. Big tusks called a Ruszor. I bet if we could find one", 0x1F);
				player:PrintToPlayer("Smile Helper : we might find that Elvaan's magical jacket.. If you could find it, I can enhance!", 0x1F);
	elseif trade:hasItemQty(14519,1) then
			player:PrintToPlayer("Smile Helper : Is that..... Could it really be? Oh my Adventurer! You found the legendary coat!", 0x1F);
		-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 14519
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 14520;
		player:PrintToPlayer("Smile Helper : There all finished! ", 0x1F);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("Smile Helper : If you found any ruszor drops I have some other things you can check out. ", 0x1F);
		player:PrintToPlayer("You obtained the Dream Robe +1.", 0xF);
	elseif trade:hasItemQty(2754,1) then
			player:PrintToPlayer("Smile Helper : I see you brought me a Ruszor Fang, I can give you one special hat for that. ", 0x1F);
		-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 2754
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 11490;
		player:PrintToPlayer("Have fun with it! ", 0x1F);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Snow Bunny Hat.", 0xF);
		player:PrintToPlayer("Smile Helper : If you found any more ruszor drops I have some other things you can check out. ", 0x1F);
	elseif trade:hasItemQty(2755,1) then
			player:PrintToPlayer("Smile Helper : I see you brought me the hide of a Ruszor, I can give you a special hat for that. ", 0x1F);
		-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 2755
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 10875;
		player:PrintToPlayer("Have fun with it! ", 0x1F);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Snowman Cap.", 0xF);
		player:PrintToPlayer("Smile Helper : If you found any more ruszor drops I have some other things you can check out. ", 0x1F);
		player:PrintToPlayer("Can get one of each of them! ", 0x1F);
	elseif trade:hasItemQty(5755,1) then
			player:PrintToPlayer("Smile Helper : I see you brought me the hide of a Ruszor, I can give you a special hat for that. ", 0x1F);
		-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 5755
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 11491;
		player:PrintToPlayer("Have fun with it! ", 0x1F);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Snow Bunny Hat +1.", 0xF);
		player:PrintToPlayer("Smile Helper : If you found any more ruszor drops I have some other things you can check out. ", 0x1F);
		player:PrintToPlayer("Can get one of each of them! ", 0x1F);
	else
		player:PrintToPlayer("<Nothing Happens>", 0x1F);
	end
end;
	

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc,itemId,quantity)
	itemId = 4216;
	quantity = 5;
	player:PrintToPlayer("Smile Helper : Happy Starlight Celebration Adventurer!", 0x1F);
	player:addItem(itemId);
	player:messageSpecial( ITEM_OBTAINED, itemId );
	player:PrintToPlayer("Smile Helper : If you haven't started the event yet, trade me back a Brilliant Snow!", 0x1F);
	player:PrintToPlayer("Smile Helper : Or show me the last enhanced item you got! Use Trade! You won't lose it!", 0x1F);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)

end;

