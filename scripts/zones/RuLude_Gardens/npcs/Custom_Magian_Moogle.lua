-----------------------------------
-- Area: Rulude Gardens
--  NPC: Custom Magian Moogle
-----------------------------------
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/common");
require("scripts/globals/settings");
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/spoofchat");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	local CUSTOM_TRIAL_ID = player:getVar("CustomTrial");
	local REWARD = 0;

	if (player:getVar("TRIAL_COMPLETE") >= 1) then
		if (player:getFreeSlotsCount() >= 1) then
			------------------------
			-- Custom trial complete
			------------------------
			if (trade:getItemCount() == 1) then
				-- Relic 1 (NM kills)
				if (CUSTOM_TRIAL_ID == 18318 and trade:hasItemQty(18318,1)) then
					REWARD = 18646;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 15070 and trade:hasItemQty(15070,1)) then
					REWARD = 16196;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18336 and trade:hasItemQty(18336,1)) then
					REWARD = 18649;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18306 and trade:hasItemQty(18306,1)) then
					REWARD = 18644;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18294 and trade:hasItemQty(18294,1)) then
					REWARD = 18642;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18330 and trade:hasItemQty(18330,1)) then
					REWARD = 18648;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18276 and trade:hasItemQty(18276,1)) then
					REWARD = 18639;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18342 and trade:hasItemQty(18342,1)) then
					REWARD = 18578;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18300 and trade:hasItemQty(18300,1)) then
					REWARD = 18643;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18288 and trade:hasItemQty(18288,1)) then
					REWARD = 18641;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18312 and trade:hasItemQty(18312,1)) then
					REWARD = 18645;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18270 and trade:hasItemQty(18270,1)) then
					REWARD = 18638;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18324 and trade:hasItemQty(18324,1)) then
					REWARD = 18647;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18282 and trade:hasItemQty(18282,1)) then
					REWARD = 18640;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18264 and trade:hasItemQty(18264,1)) then
					REWARD = 18637;
					RelicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18348 and trade:hasItemQty(18348,1)) then
					REWARD = 18650;
					RelicComplete1(player,npc,trade);

				-- Relic 2 (NM kills)
				elseif (CUSTOM_TRIAL_ID == 18646 and trade:hasItemQty(18646,1)) then
					REWARD = 18674;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 16196 and trade:hasItemQty(16196,1)) then
					REWARD = 16198;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18649 and trade:hasItemQty(18649,1)) then
					REWARD = 18677;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18644 and trade:hasItemQty(18644,1)) then
					REWARD = 18672;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18642 and trade:hasItemQty(18642,1)) then
					REWARD = 18670;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18648 and trade:hasItemQty(18648,1)) then
					REWARD = 18676;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18639 and trade:hasItemQty(18639,1)) then
					REWARD = 18667;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18578 and trade:hasItemQty(18578,1)) then
					REWARD = 18580;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18643 and trade:hasItemQty(18643,1)) then
					REWARD = 18671;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18641 and trade:hasItemQty(18641,1)) then
					REWARD = 18669;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18645 and trade:hasItemQty(18645,1)) then
					REWARD = 18673;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18638 and trade:hasItemQty(18638,1)) then
					REWARD = 18666;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18647 and trade:hasItemQty(18647,1)) then
					REWARD = 18675;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18640 and trade:hasItemQty(18640,1)) then
					REWARD = 18668;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18637 and trade:hasItemQty(18637,1)) then
					REWARD = 18665;
					RelicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18650 and trade:hasItemQty(18650,1)) then
					REWARD = 18678;
					RelicComplete2(player,npc,trade);

				-- Relic 3 (NM kills)
				elseif (CUSTOM_TRIAL_ID == 18674 and trade:hasItemQty(18674,1)) then
					REWARD = 19755;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 16198 and trade:hasItemQty(16198,1)) then
					REWARD = 11927;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18677 and trade:hasItemQty(18677,1)) then
					REWARD = 19758;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18672 and trade:hasItemQty(18672,1)) then
					REWARD = 19753;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18670 and trade:hasItemQty(18670,1)) then
					REWARD = 19751;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18676 and trade:hasItemQty(18676,1)) then
					REWARD = 19757;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18667 and trade:hasItemQty(18667,1)) then
					REWARD = 19748;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18580 and trade:hasItemQty(18580,1)) then
					REWARD = 18572;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18671 and trade:hasItemQty(18671,1)) then
					REWARD = 19752;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18669 and trade:hasItemQty(18669,1)) then
					REWARD = 19750;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18673 and trade:hasItemQty(18673,1)) then
					REWARD = 19754;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18666 and trade:hasItemQty(18666,1)) then
					REWARD = 19747;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18675 and trade:hasItemQty(18675,1)) then
					REWARD = 19756;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18668 and trade:hasItemQty(18668,1)) then
					REWARD = 19749;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18665 and trade:hasItemQty(18665,1)) then
					REWARD = 19746;
					RelicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18678 and trade:hasItemQty(18678,1)) then
					REWARD = 19759;
					RelicComplete3(player,npc,trade);

				-- Relic Final: 50 Tanzenite jewel
				elseif (CUSTOM_TRIAL_ID == 19755 and trade:hasItemQty(19755,1)) then
					REWARD = 21016;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 11927 and trade:hasItemQty(11927,1)) then
					REWARD = 16200;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19758 and trade:hasItemQty(19758,1)) then
					REWARD = 21261;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19753 and trade:hasItemQty(19753,1)) then
					REWARD = 20881;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19751 and trade:hasItemQty(19751,1)) then
					REWARD = 20836;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19757 and trade:hasItemQty(19757,1)) then
					REWARD = 21136;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19748 and trade:hasItemQty(19748,1)) then
					REWARD = 20646;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18572 and trade:hasItemQty(18572,1)) then
					REWARD = 18840;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19752 and trade:hasItemQty(19752,1)) then
					REWARD = 20926;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19750 and trade:hasItemQty(19750,1)) then
					REWARD = 20791;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19754 and trade:hasItemQty(19754,1)) then
					REWARD = 20971;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19747 and trade:hasItemQty(19747,1)) then
					REWARD = 20556;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19756 and trade:hasItemQty(19756,1)) then
					REWARD = 21061;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19749 and trade:hasItemQty(19749,1)) then
					REWARD = 20746;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19746 and trade:hasItemQty(19746,1)) then
					REWARD = 20481;
					RelicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19759 and trade:hasItemQty(19759,1)) then
					REWARD = 21211;
					RelicComplete4(player,npc,trade);

				-- Mythic 1 (NM kills)
				elseif (CUSTOM_TRIAL_ID == 18999 and trade:hasItemQty(18999,1)) then
					REWARD = 19088;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18997 and trade:hasItemQty(18997,1)) then
					REWARD = 19086;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19000 and trade:hasItemQty(19000,1)) then
					REWARD = 19089;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18991 and trade:hasItemQty(18991,1)) then
					REWARD = 19080;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19007 and trade:hasItemQty(19007,1)) then
					REWARD = 19096;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19001 and trade:hasItemQty(19001,1)) then
					REWARD = 19090;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18992 and trade:hasItemQty(18992,1)) then
					REWARD = 19081;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19002 and trade:hasItemQty(19002,1)) then
					REWARD = 19091;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18994 and trade:hasItemQty(18994,1)) then
					REWARD = 19083;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18998 and trade:hasItemQty(18998,1)) then
					REWARD = 19087;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18995 and trade:hasItemQty(18995,1)) then
					REWARD = 19084;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19003 and trade:hasItemQty(19003,1)) then
					REWARD = 19092;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19005 and trade:hasItemQty(19005,1)) then
					REWARD = 19094;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19004 and trade:hasItemQty(19004,1)) then
					REWARD = 19093;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18989 and trade:hasItemQty(18989,1)) then
					REWARD = 19098;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19006 and trade:hasItemQty(19006,1)) then
					REWARD = 19095;
					MythicComplete1(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 18990 and trade:hasItemQty(18990,1)) then
					REWARD = 19099;
					MythicComplete1(player,npc,trade);

				-- Mythic 2 85-95 (NM kills)
				elseif (CUSTOM_TRIAL_ID == 19088 and trade:hasItemQty(19088,1)) then
					REWARD = 19718;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19086 and trade:hasItemQty(19086,1)) then
					REWARD = 19716;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19089 and trade:hasItemQty(19089,1)) then
					REWARD = 19719;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19080 and trade:hasItemQty(19080,1)) then
					REWARD = 19710;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19096 and trade:hasItemQty(19096,1)) then
					REWARD = 19726;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19090 and trade:hasItemQty(19090,1)) then
					REWARD = 19720;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19081 and trade:hasItemQty(19081,1)) then
					REWARD = 19711;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19091 and trade:hasItemQty(19091,1)) then
					REWARD = 19721;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19083 and trade:hasItemQty(19083,1)) then
					REWARD = 19713;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19087 and trade:hasItemQty(19087,1)) then
					REWARD = 19717;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19084 and trade:hasItemQty(19084,1)) then
					REWARD = 19714;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19092 and trade:hasItemQty(19092,1)) then
					REWARD = 19722;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19094 and trade:hasItemQty(19094,1)) then
					REWARD = 19724;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19093 and trade:hasItemQty(19093,1)) then
					REWARD = 19723;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19098 and trade:hasItemQty(19098,1)) then
					REWARD = 19728;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19095 and trade:hasItemQty(19095,1)) then
					REWARD = 19725;
					MythicComplete2(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19099 and trade:hasItemQty(19099,1)) then
					REWARD = 19729;
					MythicComplete2(player,npc,trade);

				-- Mythic 3 95-99 (NM kills)
				elseif (CUSTOM_TRIAL_ID == 19718 and trade:hasItemQty(19718,1)) then
					REWARD = 19827;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19716 and trade:hasItemQty(19716,1)) then
					REWARD = 19825;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19719 and trade:hasItemQty(19719,1)) then
					REWARD = 19828;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19710 and trade:hasItemQty(19710,1)) then
					REWARD = 19819;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19726 and trade:hasItemQty(19726,1)) then
					REWARD = 19835;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19720 and trade:hasItemQty(19720,1)) then
					REWARD = 19829;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19711 and trade:hasItemQty(19711,1)) then
					REWARD = 19820;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19721 and trade:hasItemQty(19721,1)) then
					REWARD = 19830;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19713 and trade:hasItemQty(19713,1)) then
					REWARD = 19822;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19717 and trade:hasItemQty(19717,1)) then
					REWARD = 19826;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19714 and trade:hasItemQty(19714,1)) then
					REWARD = 19823;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19722 and trade:hasItemQty(19722,1)) then
					REWARD = 19831;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19724 and trade:hasItemQty(19724,1)) then
					REWARD = 19962;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19723 and trade:hasItemQty(19723,1)) then
					REWARD = 19832;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19728 and trade:hasItemQty(19728,1)) then
					REWARD = 19837;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19725 and trade:hasItemQty(19725,1)) then
					REWARD = 19834;
					MythicComplete3(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19729 and trade:hasItemQty(19729,1)) then
					REWARD = 19838;
					MythicComplete3(player,npc,trade);

				-- Mythic Final: 50 Tanzenite jewel
				elseif (CUSTOM_TRIAL_ID == 19827 and trade:hasItemQty(19827,1)) then
					REWARD = 20793;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19825 and trade:hasItemQty(19825,1)) then
					REWARD = 20650;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19828 and trade:hasItemQty(19828,1)) then
					REWARD = 20562;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19819 and trade:hasItemQty(19819,1)) then
					REWARD = 20838;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19835 and trade:hasItemQty(19835,1)) then
					REWARD = 21263;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19829 and trade:hasItemQty(19829,1)) then
					REWARD = 21247;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19820 and trade:hasItemQty(19820,1)) then
					REWARD = 20483;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19830 and trade:hasItemQty(19830,1)) then
					REWARD = 21018;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19822 and trade:hasItemQty(19822,1)) then
					REWARD = 21140;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19826 and trade:hasItemQty(19826,1)) then
					REWARD = 20883;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19823 and trade:hasItemQty(19823,1)) then
					REWARD = 20648;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19831 and trade:hasItemQty(19831,1)) then
					REWARD = 20973;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19962 and trade:hasItemQty(19962,1)) then
					REWARD = 21142;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19832 and trade:hasItemQty(19832,1)) then
					REWARD = 20928;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19837 and trade:hasItemQty(19837,1)) then
					REWARD = 20558;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19834 and trade:hasItemQty(19834,1)) then
					REWARD = 20652;
					MythicComplete4(player,npc,trade);
				elseif (CUSTOM_TRIAL_ID == 19838 and trade:hasItemQty(19838,1)) then
					REWARD = 21138;
					MythicComplete4(player,npc,trade);
				end
			end

			if (REWARD > 0) then
				player:tradeComplete();
				player:addItem(REWARD);
				player:messageSpecial(ITEM_OBTAINED,REWARD);
				npc:setStatus(STATUS_DISAPPEAR);
			end
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,REWARD);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:SpoofChatPlayer( "Mog: Ok trade me your item please ..Kupo!", MESSAGE_SYS_SAY, npc:getID() );
end;

-----------------------------------
-- onTrade Texts
-----------------------------------

function RelicComplete1(player,npc,trade)
	player:injectActionPacket(6, 206);
	player:SpoofChatPlayer( "Mog: Congratulations you have completed your trial, here is your prize.", MESSAGE_SYS_SAY, npc:getID() );
	player:setVar("CustomTrial",0);
	player:setVar("TRIAL_COMPLETE",0);
	player:setVar("Megalobugard_KILLS",0);
	player:setVar("Intulo_KILLS",0);
	player:setVar("Keeper_of_Halidom_KILLS",0);
	player:setVar("Dune_Widow_KILLS",0);
	player:setVar("Seww_the_Squidlimbed_KILLS",0);
	player:setVar("Mischievous_Micholas_KILLS",0);
end;

function RelicComplete2(player,npc,trade)
	player:injectActionPacket(6, 206);
	player:SpoofChatPlayer( "Mog: Congratulations you have completed your trial, here is your prize.", MESSAGE_SYS_SAY, npc:getID() );
	player:setVar("CustomTrial",0);
	player:setVar("TRIAL_COMPLETE",0);
	player:setVar("Fafnir_KILLS",0);
	player:setVar("Adamantoise_KILLS",0);
	player:setVar("Behemoth_KILLS",0);
end;

function RelicComplete3(player,npc,trade)
	player:injectActionPacket(6, 206);
	player:SpoofChatPlayer( "Mog: Congratulations you have completed your trial, here is your prize.", MESSAGE_SYS_SAY, npc:getID() );
	player:setVar("CustomTrial",0);
	player:setVar("TRIAL_COMPLETE",0);
	player:setVar("Juggler_Hecatomb_KILLS",0);
	player:setVar("Nidhogg_KILLS",0);
	player:setVar("King_Behemoth_KILLS",0);
	player:setVar("Aspidochelone_KILLS",0);
	player:setVar("Ash_Dragon_KILLS",0);
end;

function RelicComplete4(player,npc,trade)
	player:injectActionPacket(6, 206);
	player:setVar("CustomTrial",0);
	player:setVar("TRIAL_COMPLETE",0);
	player:SpoofChatPlayer( "Mog: Congratulations you have completed your trial, here is your prize.", MESSAGE_SYS_SAY, npc:getID() );
	player:SpoofChatPlayer( "Mog: All trials complete for this Item!", MESSAGE_SYS_SAY, npc:getID() );
end;

function MythicComplete1(player,npc,trade)
	player:injectActionPacket(6, 206);
	player:SpoofChatPlayer( "Mog: Congratulations you have completed your trial, here is your prize.", MESSAGE_SYS_SAY, npc:getID() );
	player:setVar("CustomTrial",0);
	player:setVar("TRIAL_COMPLETE",0);
	player:setVar("Zareehkl_the_Jubilant_KILLS",0);
	player:setVar("Iriz_Irma_KILLS",0);
	player:setVar("Velionis_KILLS",0);
	player:setVar("Brass_Borer_KILLS",0);
	player:setVar("Dextrose_KILLS",0);
	player:setVar("Iriri_Samariri_KILLS",0);
end;

function MythicComplete2(player,npc,trade)
	player:injectActionPacket(6, 206);
	player:SpoofChatPlayer( "Mog: Congratulations you have completed your trial, here is your prize.", MESSAGE_SYS_SAY, npc:getID() );
	player:setVar("CustomTrial",0);
	player:setVar("TRIAL_COMPLETE",0);
	player:setVar("Armed_Gears_KILLS",0);
	player:setVar("Nosferatu_KILLS",0);
	player:setVar("Achamoth_KILLS",0);
	player:setVar("Experimental_Lamia_KILLS",0);
end;

function MythicComplete3(player,npc,trade)
	player:injectActionPacket(6, 206);
	player:SpoofChatPlayer( "Mog: Congratulations you have completed your trial, here is your prize.", MESSAGE_SYS_SAY, npc:getID() );
	player:setVar("CustomTrial",0);
	player:setVar("TRIAL_COMPLETE",0);
	player:setVar("Cerberus_KILLS",0);
	player:setVar("Khimara_KILLS",0);
	player:setVar("Medusa_KILLS",0);
	player:setVar("Gulool_Ja_Ja_KILLS",0);
	player:setVar("Gurfurlur_the_Menacing_KILLS",0);
	player:setVar("Hydra_KILLS",0);
end;

function MythicComplete4(player,npc,trade)
	player:injectActionPacket(6, 206);
	player:setVar("CustomTrial",0);
	player:setVar("TRIAL_COMPLETE",0);
	player:SpoofChatPlayer( "Mog: Congratulations you have completed your trial, here is your prize.", MESSAGE_SYS_SAY, npc:getID() );
	player:SpoofChatPlayer( "Mog: All trials complete for this Item!", MESSAGE_SYS_SAY, npc:getID() );
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("finishRESULT: %u",option);
end;