-------------------------------------------------
--	Author: Ezekyel
--	Crafting functions
--  Info from:
--      http://wiki.ffxiclopedia.org/wiki/Crafts_%26_Hobbies
-------------------------------------------------

-- 1 2 : Alchemy
-- 2 4 : Bonecraft
-- 3 8 : Clothcraft
-- 4: Cooking
-- 5: Fishing
-- 6: Goldsmithing
-- 7: Leathercraft
-- 8: Smithing
-- 9: Woodworking
-- 10: Synergy

-----------------------------------
-- Table for Test Item
-----------------------------------

local TI_Alchemy = {937,4157,4163,947,16543,4116,16479,4120,16609,10792};
local TI_Bonecraft = {13442,13441,13323,13459,13091,17299,16420,12508,13987,11058}; --  Way of The Boneworker + Hajduk Ring
local TI_Clothcraft = {13583,13584,13204,13075,12723,13586,13752,12612,14253,11000};
local TI_Cooking = {4355,4416,4489,4381,4413,4558,4546,4440,4561,}; -- Sprightly Soup + Way of the Culinarian
local TI_Fishing = {5789,4379,4469,4480,5801,5806,5807,5809,4474,}; -- Tiger shark
local TI_Goldsmithing = {12496,12497,12495,13082,13446,13084,12545,13125,16515,}; --  Evader Earring**Guild item must be made with an Inferno Crystal
local TI_Leathercraft = {13594,16386,13588,13195,12571,12572,12980,12702,12447,}; --  Urja Trousers(Signed with Terra Crystal)
local TI_Smithing = {16530,12299,16512,16650,16651,16559,12427,16577,12428,}; -- Gorkhali Kukri
local TI_Woodworking = {22,23,17354,17348,17053,17156,17054,56,17101,}; -- Vejovis wand signed
local TI_Synergy = {};

-----------------------------------
-- isGuildMember Action
-----------------------------------

function isGuildMember(player,guild)

	local guildOK = player:getVar("Guild_Member");
	local bit = {};

	for i = 12,1,-1 do
		twop = 2^i

		if(guildOK >= twop) then
			bit[i]=1; guildOK = guildOK - twop;
		else
			bit[i]=0;
		end
		--printf("bit %u: %u",i,bit[i]);
	end;

	return bit[guild];

end;

-----------------------------------
-- signupGuild Action
-----------------------------------

function signupGuild(player,nbr)
	player:setVar("Guild_Member",player:getVar("Guild_Member") + nbr);
end;

-----------------------------------
-- getTestItem Action
-----------------------------------

function getTestItem(player,npc,craftID)

	local TItemList = {};
	local NextRank = player:getSkillRank(craftID) + 1;

	switch (npc:getName()): caseof
	{
		["Abd-al-Raziq"] = function (x) 	TItemList = TI_Alchemy; end,
		["Peshi_Yohnts"] = function (x) 	TItemList = TI_Bonecraft; end,
		["Ponono"] = function (x) 			TItemList = TI_Clothcraft; end,
		["Piketo-Puketo"] = function (x) 	TItemList = TI_Cooking; end,
		["Thubu_Parohren"] = function (x) 	TItemList = TI_Fishing; end,
		["Reinberta"] = function (x) 		TItemList = TI_Goldsmithing; end,
		["Faulpie"] = function (x) 			TItemList = TI_Leathercraft; end,
		["Mevreauche"] = function (x) 		TItemList = TI_Smithing; end,
		["Ghemp"] = function (x) 			TItemList = TI_Smithing; end,
		["Cheupirudaux"] = function (x) 	TItemList = TI_Woodworking; end,
	}

	return TItemList[NextRank];
end;

-----------------------------------
-- canGetNewRank Action
-----------------------------------

function canGetNewRank(player,skillLvL,craftID)

	local Rank = player:getSkillRank(craftID) + 1;
	local canGet = 0;

	-- 0 fonctionne pas en lua donc rank + 1
	if(Rank == 1 and skillLvL >= 256 or
	   Rank == 2 and skillLvL >= 577 or
	   Rank == 3 and skillLvL >= 898 or
	   Rank == 4 and skillLvL >= 1219 or
	   Rank == 5 and skillLvL >= 1540 or
	   Rank == 6 and skillLvL >= 1861 or
	   Rank == 7 and skillLvL >= 2182 or
	   Rank == 8 and skillLvL >= 2503 or
	   Rank == 9 and skillLvL >= 2824 or
	   Rank == 10 and skillLvL >= 3145) then
			canGet = 1;
	end

	return canGet;

end;

-----------------------------------
-- tradeTestItem Action
-----------------------------------

function tradeTestItem(player,npc,trade,craftID)

	local skillLvL = player:getSkillLevel(craftID)
	local myTI = getTestItem(player,npc,craftID);
	local newRank = 0;

	if(canGetNewRank(player,skillLvL,craftID) == 1 and
	   trade:hasItemQty(myTI,1) and
	   trade:getItemCount() == 1) then
		newRank = player:getSkillRank(craftID) + 1;
		player:tradeComplete();
	end

	return newRank;

end;

-- 1: test item
-- 2: skill point
-- 3: ??
-- 4: 0 pas dans la guilde 1 dans la guilde
-- 7: 0 pas deja dans une guilde, 11: nombreuse guilde