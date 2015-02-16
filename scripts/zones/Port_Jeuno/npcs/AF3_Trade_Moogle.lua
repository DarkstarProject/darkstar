-----------------------------------
-- Area: Port Jeuno
-- NPC: Haubijoux
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Port_Jeuno/TextIDs");
require("scripts/globals/spoofchat");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
---------------
-- AF3 - AF3+1
---------------

----------------------------THF-------------------------------------
	if (trade:hasItemQty(3115,8) and trade:hasItemQty(12013,1) and trade:getItemCount() == 9) then 		--head
		player:addItem(11169);
		player:messageSpecial(ITEM_OBTAINED,11169);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3135,10) and trade:hasItemQty(12033,1) and trade:getItemCount() == 11) then    -- body
		player:addItem(11189);
		player:messageSpecial(ITEM_OBTAINED,11189);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3155,8) and trade:hasItemQty(12053,1) and trade:getItemCount() == 9) then 		--hands
		player:addItem(11209);
		player:messageSpecial(ITEM_OBTAINED,11209);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3175,8) and trade:hasItemQty(12073,1) and trade:getItemCount() == 9) then 		--legs
		player:addItem(11229);
		player:messageSpecial(ITEM_OBTAINED,11229);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3195,8) and trade:hasItemQty(12093,1) and trade:getItemCount() == 9) then 		--feet
		player:addItem(11249);
		player:messageSpecial(ITEM_OBTAINED,11249);
		player:tradeComplete();
	end
----------------------------WAR-------------------------------------
	if (trade:hasItemQty(3110,8) and trade:hasItemQty(12008,1) and trade:getItemCount() == 9) then		--head
		player:addItem(11164);
		player:messageSpecial(ITEM_OBTAINED,11164);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3130,10) and trade:hasItemQty(12028,1) and trade:getItemCount() == 11) then	--body
		player:addItem(11184);
		player:messageSpecial(ITEM_OBTAINED,11184);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3150,8) and trade:hasItemQty(12048,1) and trade:getItemCount() == 9) then		--hands
		player:addItem(11204);
		player:messageSpecial(ITEM_OBTAINED,11204);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3170,8) and trade:hasItemQty(12068,1) and trade:getItemCount() == 9) then 		--legs
		player:addItem(11224);
		player:messageSpecial(ITEM_OBTAINED,11224);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3190,8) and trade:hasItemQty(12088,1) and trade:getItemCount() == 9) then		--feet
		player:addItem(11244);
		player:messageSpecial(ITEM_OBTAINED,11244);
		player:tradeComplete();
	end
----------------------------MNK-------------------------------------
	if (trade:hasItemQty(3111,8) and trade:hasItemQty(12009,1) and trade:getItemCount() == 9) then		--head
		player:addItem(11165);
		player:messageSpecial(ITEM_OBTAINED,11165);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3131,10) and trade:hasItemQty(12029,1) and trade:getItemCount() == 11) then	--body
		player:addItem(11185);
		player:messageSpecial(ITEM_OBTAINED,11185);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3151,8) and trade:hasItemQty(12049,1) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11205);
		player:messageSpecial(ITEM_OBTAINED,11205);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3171,8) and trade:hasItemQty(12069,1) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11225);
		player:messageSpecial(ITEM_OBTAINED,11225);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3191,8) and trade:hasItemQty(12089,1) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11245);
		player:messageSpecial(ITEM_OBTAINED,11245);
		player:tradeComplete();
	end
----------------------------WHM-------------------------------------
	if (trade:hasItemQty(3112,8) and trade:hasItemQty(12010,1) and trade:getItemCount() == 9) then					--head
		player:addItem(11166);
		player:messageSpecial(ITEM_OBTAINED,11166);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3132,10) and trade:hasItemQty(12030,1) and trade:getItemCount() == 11) then				--body
		player:addItem(11186);
		player:messageSpecial(ITEM_OBTAINED,11186);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3152,8) and trade:hasItemQty(12050,1) and trade:getItemCount() == 9) then					--hands
		player:addItem(11206);
		player:messageSpecial(ITEM_OBTAINED,11206);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3172,8) and trade:hasItemQty(12070,1) and trade:getItemCount() == 9) then			--legs
		player:addItem(11226);
		player:messageSpecial(ITEM_OBTAINED,11226);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3192,8) and trade:hasItemQty(12090,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11246);
		player:messageSpecial(ITEM_OBTAINED,11246);
		player:tradeComplete();
	end
----------------------------RDM-------------------------------------
	if (trade:hasItemQty(3114,8) and trade:hasItemQty(12012,1) and trade:getItemCount() == 9) then					--head
		player:addItem(11168);
		player:messageSpecial(ITEM_OBTAINED,11168);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3134,10) and trade:hasItemQty(12032,1) and trade:getItemCount() == 11) then				--body
		player:addItem(11188);
		player:messageSpecial(ITEM_OBTAINED,11188);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3154,8) and trade:hasItemQty(12052,1) and trade:getItemCount() == 9) then					--hands
		player:addItem(11208);
		player:messageSpecial(ITEM_OBTAINED,11208);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3174,8) and trade:hasItemQty(12072,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11228);
		player:messageSpecial(ITEM_OBTAINED,11228);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3194,8) and trade:hasItemQty(12092,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11248);
		player:messageSpecial(ITEM_OBTAINED,11248);
		player:tradeComplete();
	end
----------------------------BLM-------------------------------------
	if (trade:hasItemQty(3113,8) and trade:hasItemQty(12011,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11167);
		player:messageSpecial(ITEM_OBTAINED,11167);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3133,10) and trade:hasItemQty(12031,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11187);
		player:messageSpecial(ITEM_OBTAINED,11187);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3153,8) and trade:hasItemQty(12051,1) and trade:getItemCount() == 9) then				--hands
		player:addItem(11207);
		player:messageSpecial(ITEM_OBTAINED,11207);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3173,8) and trade:hasItemQty(12071,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11227);
		player:messageSpecial(ITEM_OBTAINED,11227);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3193,8) and trade:hasItemQty(12091,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11247);
		player:messageSpecial(ITEM_OBTAINED,11247);
		player:tradeComplete();
	end
----------------------------PLD-------------------------------------
	if (trade:hasItemQty(3116,8) and trade:hasItemQty(12014,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11170);
		player:messageSpecial(ITEM_OBTAINED,11170);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3136,10) and trade:hasItemQty(12034,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11190);
		player:messageSpecial(ITEM_OBTAINED,11190);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3156,8) and trade:hasItemQty(12054,1) and trade:getItemCount() == 9) then				--hands
		player:addItem(11210);
		player:messageSpecial(ITEM_OBTAINED,11210);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3176,8) and trade:hasItemQty(12074,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11230);
		player:messageSpecial(ITEM_OBTAINED,11230);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3196,8) and trade:hasItemQty(12094,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11250);
		player:messageSpecial(ITEM_OBTAINED,11250);
		player:tradeComplete();
	end
----------------------------DRK-------------------------------------
	if (trade:hasItemQty(3117,8) and trade:hasItemQty(12015,1) and trade:getItemCount() == 9) then					--head
		player:addItem(11171);
		player:messageSpecial(ITEM_OBTAINED,11171);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3137,10) and trade:hasItemQty(12035,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11191);
		player:messageSpecial(ITEM_OBTAINED,11191);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3157,8) and trade:hasItemQty(12055,1) and trade:getItemCount() == 9) then				--hands
		player:addItem(11211);
		player:messageSpecial(ITEM_OBTAINED,11211);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3177,8) and trade:hasItemQty(12075,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11231);
		player:messageSpecial(ITEM_OBTAINED,11231);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3197,8) and trade:hasItemQty(12095,1) and trade:getItemCount() == 9) then			--feet
		player:addItem(11251);
		player:messageSpecial(ITEM_OBTAINED,11251);
		player:tradeComplete();
	end
----------------------------BST-------------------------------------
	if (trade:hasItemQty(3118,8) and trade:hasItemQty(12016,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11172);
		player:messageSpecial(ITEM_OBTAINED,11172);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3138,10) and trade:hasItemQty(12036,1) and trade:getItemCount() == 11) then				--body
		player:addItem(11192);
		player:messageSpecial(ITEM_OBTAINED,11192);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3158,8) and trade:hasItemQty(12056,1) and trade:getItemCount() == 9) then				--hands
		player:addItem(11212);
		player:messageSpecial(ITEM_OBTAINED,11212);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3178,8) and trade:hasItemQty(12076,1) and trade:getItemCount() == 9) then					--legs
		player:addItem(11232);
		player:messageSpecial(ITEM_OBTAINED,11232);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3198,8) and trade:hasItemQty(12096,1) and trade:getItemCount() == 9) then					--feet
		player:addItem(11252);
		player:messageSpecial(ITEM_OBTAINED,11252);
		player:tradeComplete();
	end
----------------------------BRD-------------------------------------
	if (trade:hasItemQty(3119,8) and trade:hasItemQty(12017,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11173);
		player:messageSpecial(ITEM_OBTAINED,11173);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3139,10) and trade:hasItemQty(12037,1) and trade:getItemCount() == 11) then					--body
		player:addItem(11193);
		player:messageSpecial(ITEM_OBTAINED,11193);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3159,8) and trade:hasItemQty(12057,1) and trade:getItemCount() == 9) then					--hands
		player:addItem(11213);
		player:messageSpecial(ITEM_OBTAINED,11213);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3179,8) and trade:hasItemQty(12077,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11233);
		player:messageSpecial(ITEM_OBTAINED,11233);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3199,8) and trade:hasItemQty(12097,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11253);
		player:messageSpecial(ITEM_OBTAINED,11253);
		player:tradeComplete();
	end
----------------------------RNG-------------------------------------
	if (trade:hasItemQty(3120,8) and trade:hasItemQty(12018,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11174);
		player:messageSpecial(ITEM_OBTAINED,11174);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3140,10) and trade:hasItemQty(12038,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11194);
		player:messageSpecial(ITEM_OBTAINED,11194);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3160,8) and trade:hasItemQty(12058,1) and trade:getItemCount() == 9) then					--hands
		player:addItem(11214);
		player:messageSpecial(ITEM_OBTAINED,11214);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3180,8) and trade:hasItemQty(12078,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11234);
		player:messageSpecial(ITEM_OBTAINED,11234);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3200,8) and trade:hasItemQty(12098,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11254);
		player:messageSpecial(ITEM_OBTAINED,11254);
		player:tradeComplete();
	end
----------------------------SAM-------------------------------------
	if (trade:hasItemQty(3121,8) and trade:hasItemQty(12019,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11175);
		player:messageSpecial(ITEM_OBTAINED,11175);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3141,10) and trade:hasItemQty(12039,1) and trade:getItemCount() == 11) then				--body
		player:addItem(11195);
		player:messageSpecial(ITEM_OBTAINED,11195);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3161,8) and trade:hasItemQty(12059,1) and trade:getItemCount() == 9) then				--hands
		player:addItem(11215);
		player:messageSpecial(ITEM_OBTAINED,11215);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3181,8) and trade:hasItemQty(12079,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11235);
		player:messageSpecial(ITEM_OBTAINED,11235);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3201,8) and trade:hasItemQty(12099,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11255);
		player:messageSpecial(ITEM_OBTAINED,11255);
		player:tradeComplete();
	end
----------------------------NIN-------------------------------------
	if (trade:hasItemQty(3122,8) and trade:hasItemQty(12020,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11176);
		player:messageSpecial(ITEM_OBTAINED,11176);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3142,10) and trade:hasItemQty(12040,1) and trade:getItemCount() == 11) then				--body
		player:addItem(11196);
		player:messageSpecial(ITEM_OBTAINED,11196);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3162,8) and trade:hasItemQty(12060,1) and trade:getItemCount() == 9) then				--hands
		player:addItem(11216);
		player:messageSpecial(ITEM_OBTAINED,11216);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3182,8) and trade:hasItemQty(12080,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11236);
		player:messageSpecial(ITEM_OBTAINED,11236);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3202,8) and trade:hasItemQty(12100,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11256);
		player:messageSpecial(ITEM_OBTAINED,11256);
		player:tradeComplete();
	end
----------------------------DRG-------------------------------------
	if (trade:hasItemQty(3123,8) and trade:hasItemQty(12021,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11177);
		player:messageSpecial(ITEM_OBTAINED,11177);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3143,10) and trade:hasItemQty(12041,1) and trade:getItemCount() == 11) then				--body
		player:addItem(11197);
		player:messageSpecial(ITEM_OBTAINED,11197);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3163,8) and trade:hasItemQty(12061,1) and trade:getItemCount() == 9) then					--hands
		player:addItem(11217);
		player:messageSpecial(ITEM_OBTAINED,11217);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3183,8) and trade:hasItemQty(12081,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11237);
		player:messageSpecial(ITEM_OBTAINED,11237);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3203,8) and trade:hasItemQty(12101,1) and trade:getItemCount() == 9) then			--feet
		player:addItem(11257);
		player:messageSpecial(ITEM_OBTAINED,11257);
		player:tradeComplete();
	end
----------------------------SMN-------------------------------------
	if (trade:hasItemQty(3124,8) and trade:hasItemQty(12022,1) and trade:getItemCount() == 9) then			--head
		player:addItem(11178);
		player:messageSpecial(ITEM_OBTAINED,11178);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3144,10) and trade:hasItemQty(12042,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11198);
		player:messageSpecial(ITEM_OBTAINED,11198);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3164,8) and trade:hasItemQty(12062,1) and trade:getItemCount() == 9) then				--hands
		player:addItem(11218);
		player:messageSpecial(ITEM_OBTAINED,11218);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3184,8) and trade:hasItemQty(12082,1) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11238);
		player:messageSpecial(ITEM_OBTAINED,11238);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3204,8) and trade:hasItemQty(12102,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11258);
		player:messageSpecial(ITEM_OBTAINED,11258);
		player:tradeComplete();
	end
----------------------------BLU-------------------------------------
	if (trade:hasItemQty(3125,8) and trade:hasItemQty(12023,1) and trade:getItemCount() == 9) then			--head
		player:addItem(11179);
		player:messageSpecial(ITEM_OBTAINED,11179);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3145,10) and trade:hasItemQty(12043,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11199);
		player:messageSpecial(ITEM_OBTAINED,11199);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3165,8) and trade:hasItemQty(12063,1) and trade:getItemCount() == 9) then			--hands
		player:addItem(11219);
		player:messageSpecial(ITEM_OBTAINED,11219);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3185,8) and trade:hasItemQty(12083,1) and trade:getItemCount() == 9) then				--legs
		player:addItem(11239);
		player:messageSpecial(ITEM_OBTAINED,11239);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3205,8) and trade:hasItemQty(12103,1) and trade:getItemCount() == 9) then			--feet
		player:addItem(11259);
		player:messageSpecial(ITEM_OBTAINED,11259);
		player:tradeComplete();
	end
----------------------------COR-------------------------------------
	if (trade:hasItemQty(3126,8) and trade:hasItemQty(12024,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11180);
		player:messageSpecial(ITEM_OBTAINED,11180);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3146,10) and trade:hasItemQty(12044,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11200);
		player:messageSpecial(ITEM_OBTAINED,11200);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3166,8) and trade:hasItemQty(12064,1) and trade:getItemCount() == 9) then				--hands
		player:addItem(11220);
		player:messageSpecial(ITEM_OBTAINED,11220);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3186,8) and trade:hasItemQty(12084,1) and trade:getItemCount() == 9) then			--legs
		player:addItem(11240);
		player:messageSpecial(ITEM_OBTAINED,11240);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3206,8) and trade:hasItemQty(12104,1) and trade:getItemCount() == 9) then			--feet
		player:addItem(11260);
		player:messageSpecial(ITEM_OBTAINED,11260);
		player:tradeComplete();
	end
----------------------------PUP-------------------------------------
	if (trade:hasItemQty(3127,8) and trade:hasItemQty(12025,1) and trade:getItemCount() == 9) then			--head
		player:addItem(11081);
		player:messageSpecial(ITEM_OBTAINED,11081);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3147,10) and trade:hasItemQty(12045,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11101);
		player:messageSpecial(ITEM_OBTAINED,11101);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3167,8) and trade:hasItemQty(12065,1) and trade:getItemCount() == 9) then			--hands
		player:addItem(11121);
		player:messageSpecial(ITEM_OBTAINED,11121);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3187,8) and trade:hasItemQty(12085,1) and trade:getItemCount() == 9) then			--legs
		player:addItem(11141);
		player:messageSpecial(ITEM_OBTAINED,11141);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3207,8) and trade:hasItemQty(12105,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11161);
		player:messageSpecial(ITEM_OBTAINED,11161);
		player:tradeComplete();
	end
----------------------------DNC-------------------------------------
	if (trade:hasItemQty(3128,8) and trade:hasItemQty(12026,1) and trade:getItemCount() == 9) then			--head
		player:addItem(11182);
		player:messageSpecial(ITEM_OBTAINED,11182);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3148,10) and trade:hasItemQty(12046,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11202);
		player:messageSpecial(ITEM_OBTAINED,11202);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3168,8) and trade:hasItemQty(12066,1) and trade:getItemCount() == 9) then			--hands
		player:addItem(11222);
		player:messageSpecial(ITEM_OBTAINED,11222);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3188,8) and trade:hasItemQty(12086,1) and trade:getItemCount() == 9) then			--legs
		player:addItem(11242);
		player:messageSpecial(ITEM_OBTAINED,11242);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3208,8) and trade:hasItemQty(12106,1) and trade:getItemCount() == 9) then			--feet
		player:addItem(11262);
		player:messageSpecial(ITEM_OBTAINED,11262);
		player:tradeComplete();
	end
----------------------------SCH-------------------------------------
	if (trade:hasItemQty(3129,8) and trade:hasItemQty(12027,1) and trade:getItemCount() == 9) then				--head
		player:addItem(11183);
		player:messageSpecial(ITEM_OBTAINED,11183);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3149,10) and trade:hasItemQty(12047,1) and trade:getItemCount() == 11) then			--body
		player:addItem(11203);
		player:messageSpecial(ITEM_OBTAINED,11203);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3169,8) and trade:hasItemQty(12067,1) and trade:getItemCount() == 9) then			--hands
		player:addItem(11223);
		player:messageSpecial(ITEM_OBTAINED,11223);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3189,8) and trade:hasItemQty(12087,1) and trade:getItemCount() == 9) then			--legs
		player:addItem(11243);
		player:messageSpecial(ITEM_OBTAINED,11243);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3209,8) and trade:hasItemQty(12107,1) and trade:getItemCount() == 9) then				--feet
		player:addItem(11263);
		player:messageSpecial(ITEM_OBTAINED,11263);
		player:tradeComplete();
	end
----------------
-- AF3+1 - AF3+2
----------------
-----------------------------------------------AF3+2---------------------------------------------------
----------------------------THF-------------------------------------
	if (trade:hasItemQty(3210,6) and trade:hasItemQty(11169,1) and trade:getItemCount() == 7) then 		--head
		player:addItem(11069);
		player:messageSpecial(ITEM_OBTAINED,11069);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3215,9) and trade:hasItemQty(11189,1) and trade:getItemCount() == 10) then -- body
		player:addItem(11089);
		player:messageSpecial(ITEM_OBTAINED,11089);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3218,6) and trade:hasItemQty(11209,1) and trade:getItemCount() == 7) then 		--hands
		player:addItem(11109);
		player:messageSpecial(ITEM_OBTAINED,11109);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3223,6) and trade:hasItemQty(11229,1) and trade:getItemCount() == 7) then 		--legs
		player:addItem(11129);
		player:messageSpecial(ITEM_OBTAINED,11129);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3228,6) and trade:hasItemQty(11249,1) and trade:getItemCount() == 7) then 		--feet
		player:addItem(11149);
		player:messageSpecial(ITEM_OBTAINED,11149);
		player:tradeComplete();
	end
----------------------------WAR-------------------------------------
	if (trade:hasItemQty(3210,6) and trade:hasItemQty(11164,1) and trade:getItemCount() == 7) then		--head
		player:addItem(11064);
		player:messageSpecial(ITEM_OBTAINED,11064);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3214,9) and trade:hasItemQty(11184,1) and trade:getItemCount() == 10) then	     --body
		player:addItem(11084);
		player:messageSpecial(ITEM_OBTAINED,11084);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3218,6) and trade:hasItemQty(11204,1) and trade:getItemCount() == 7) then		--hands
		player:addItem(11104);
		player:messageSpecial(ITEM_OBTAINED,11104);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3222,6) and trade:hasItemQty(11224,1) and trade:getItemCount() == 7) then 		--legs
		player:addItem(11124);
		player:messageSpecial(ITEM_OBTAINED,11124);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3226,6) and trade:hasItemQty(11244,1) and trade:getItemCount() == 7) then		--feet
		player:addItem(11144);
		player:messageSpecial(ITEM_OBTAINED,11144);
		player:tradeComplete();
	end
----------------------------MNK-------------------------------------
	if (trade:hasItemQty(3212,6) and trade:hasItemQty(11165,1) and trade:getItemCount() == 7) then		--head
		player:addItem(11065);
		player:messageSpecial(ITEM_OBTAINED,11065);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3217,9) and trade:hasItemQty(11185,1) and trade:getItemCount() == 9) then	--body
		player:addItem(11085);
		player:messageSpecial(ITEM_OBTAINED,11085);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3220,6) and trade:hasItemQty(11205,1) and trade:getItemCount() == 7) then 					--hands
		player:addItem(11105);
		player:messageSpecial(ITEM_OBTAINED,11105);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3224,6) and trade:hasItemQty(11225,1) and trade:getItemCount() == 7) then 					--legs
		player:addItem(11125);
		player:messageSpecial(ITEM_OBTAINED,11125);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3227,6) and trade:hasItemQty(11245,1) and trade:getItemCount() == 7) then 					--feet
		player:addItem(11145);
		player:messageSpecial(ITEM_OBTAINED,11145);
		player:tradeComplete();
	end
----------------------------WHM-------------------------------------
	if (trade:hasItemQty(3210,6) and trade:hasItemQty(11166,1) and trade:getItemCount() == 7) then					--head
		player:addItem(11066);
		player:messageSpecial(ITEM_OBTAINED,11066);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3217,9) and trade:hasItemQty(11186,1) and trade:getItemCount() == 10) then					--body
		player:addItem(11086);
		player:messageSpecial(ITEM_OBTAINED,11086);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3219,6) and trade:hasItemQty(11206,1) and trade:getItemCount() == 7) then					--hands
		player:addItem(11106);
		player:messageSpecial(ITEM_OBTAINED,11106);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3225,6) and trade:hasItemQty(11226,1) and trade:getItemCount() == 7) then					--legs
		player:addItem(11126);
		player:messageSpecial(ITEM_OBTAINED,11126);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3228,6) and trade:hasItemQty(11246,1) and trade:getItemCount() == 7) then					--feet
		player:addItem(11146);
		player:messageSpecial(ITEM_OBTAINED,11146);
		player:tradeComplete();
	end
----------------------------RDM-------------------------------------
	if (trade:hasItemQty(3212,6) and trade:hasItemQty(11168,1) and trade:getItemCount() == 7) then					--head
		player:addItem(11068);
		player:messageSpecial(ITEM_OBTAINED,11068);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3216,9) and trade:hasItemQty(11188,1) and trade:getItemCount() == 9) then					--body
		player:addItem(11088);
		player:messageSpecial(ITEM_OBTAINED,11088);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3218,6) and trade:hasItemQty(11208,1) and trade:getItemCount() == 7) then					--hands
		player:addItem(11108);
		player:messageSpecial(ITEM_OBTAINED,11108);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3223,6) and trade:hasItemQty(11228,1) and trade:getItemCount() == 7) then					--legs
		player:addItem(11128);
		player:messageSpecial(ITEM_OBTAINED,11128);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3226,6) and trade:hasItemQty(11248,1) and trade:getItemCount() == 7) then					--feet
		player:addItem(11148);
		player:messageSpecial(ITEM_OBTAINED,11148);
		player:tradeComplete();
	end
----------------------------BLM-------------------------------------
	if (trade:hasItemQty(3211,6) and trade:hasItemQty(11167,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11067);
		player:messageSpecial(ITEM_OBTAINED,11067);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3216,9) and trade:hasItemQty(11187,1) and trade:getItemCount() == 10) then				--body
		player:addItem(11087);
		player:messageSpecial(ITEM_OBTAINED,11087);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3220,6) and trade:hasItemQty(11207,1) and trade:getItemCount() == 7) then				--hands
		player:addItem(11107);
		player:messageSpecial(ITEM_OBTAINED,11107);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3222,6) and trade:hasItemQty(11227,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11127);
		player:messageSpecial(ITEM_OBTAINED,11127);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3229,6) and trade:hasItemQty(11247,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11147);
		player:messageSpecial(ITEM_OBTAINED,11147);
		player:tradeComplete();
	end
----------------------------PLD-------------------------------------
	if (trade:hasItemQty(3213,6) and trade:hasItemQty(11170,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11070);
		player:messageSpecial(ITEM_OBTAINED,11070);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3214,9) and trade:hasItemQty(11190,1) and trade:getItemCount() == 10) then				--body
		player:addItem(11090);
		player:messageSpecial(ITEM_OBTAINED,11090);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3221,6) and trade:hasItemQty(11210,1) and trade:getItemCount() == 7) then				--hands
		player:addItem(11110);
		player:messageSpecial(ITEM_OBTAINED,11110);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3223,6) and trade:hasItemQty(11230,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11130);
		player:messageSpecial(ITEM_OBTAINED,11130);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3226,6) and trade:hasItemQty(11250,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11150);
		player:messageSpecial(ITEM_OBTAINED,11150);
		player:tradeComplete();
	end
----------------------------DRK-------------------------------------
	if (trade:hasItemQty(3212,6) and trade:hasItemQty(11171,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11071);
		player:messageSpecial(ITEM_OBTAINED,11071);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3215,9) and trade:hasItemQty(11191,1) and trade:getItemCount() == 10) then				--body
		player:addItem(11091);
		player:messageSpecial(ITEM_OBTAINED,11091);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3219,6) and trade:hasItemQty(11211,1) and trade:getItemCount() == 7) then				--hands
		player:addItem(11111);
		player:messageSpecial(ITEM_OBTAINED,11111);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3223,6) and trade:hasItemQty(11231,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11131);
		player:messageSpecial(ITEM_OBTAINED,11131);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3227,6) and trade:hasItemQty(11251,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11151);
		player:messageSpecial(ITEM_OBTAINED,11151);
		player:tradeComplete();
	end
----------------------------BST-------------------------------------
	if (trade:hasItemQty(3211,6) and trade:hasItemQty(11172,1) and trade:getItemCount() == 7) then					--head
		player:addItem(11072);
		player:messageSpecial(ITEM_OBTAINED,11072);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3217,9) and trade:hasItemQty(11192,1) and trade:getItemCount() == 10) then					--body
		player:addItem(11092);
		player:messageSpecial(ITEM_OBTAINED,11092);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3218,6) and trade:hasItemQty(11212,1) and trade:getItemCount() == 7) then					--hands
		player:addItem(11112);
		player:messageSpecial(ITEM_OBTAINED,11112);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3224,6) and trade:hasItemQty(11232,1) and trade:getItemCount() == 7) then					--legs
		player:addItem(11132);
		player:messageSpecial(ITEM_OBTAINED,11132);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3229,6) and trade:hasItemQty(11252,1) and trade:getItemCount() == 7) then					--feet
		player:addItem(11152);
		player:messageSpecial(ITEM_OBTAINED,11152);
		player:tradeComplete();
	end
----------------------------BRD-------------------------------------
	if (trade:hasItemQty(3210,6) and trade:hasItemQty(11173,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11073);
		player:messageSpecial(ITEM_OBTAINED,11073);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3214,9) and trade:hasItemQty(11193,1) and trade:getItemCount() == 10) then					--body
		player:addItem(11093);
		player:messageSpecial(ITEM_OBTAINED,11093);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3220,6) and trade:hasItemQty(11213,1) and trade:getItemCount() == 7) then					--hands
		player:addItem(11113);
		player:messageSpecial(ITEM_OBTAINED,11113);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3223,6) and trade:hasItemQty(11233,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11133);
		player:messageSpecial(ITEM_OBTAINED,11133);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3228,6) and trade:hasItemQty(11253,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11153);
		player:messageSpecial(ITEM_OBTAINED,11153);
		player:tradeComplete();
	end
----------------------------RNG-------------------------------------
	if (trade:hasItemQty(3210,6) and trade:hasItemQty(11174,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11074);
		player:messageSpecial(ITEM_OBTAINED,11074);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3215,9) and trade:hasItemQty(11194,1) and trade:getItemCount() == 10) then	    		--body
		player:addItem(11094);
		player:messageSpecial(ITEM_OBTAINED,11094);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3219,6) and trade:hasItemQty(11214,1) and trade:getItemCount() == 7) then				--hands
		player:addItem(11114);
		player:messageSpecial(ITEM_OBTAINED,11114);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3224,6) and trade:hasItemQty(11234,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11134);
		player:messageSpecial(ITEM_OBTAINED,11134);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3229,6) and trade:hasItemQty(11254,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11154);
		player:messageSpecial(ITEM_OBTAINED,11154);
		player:tradeComplete();
	end
----------------------------SAM-------------------------------------
	if (trade:hasItemQty(3212,6) and trade:hasItemQty(11175,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11075);
		player:messageSpecial(ITEM_OBTAINED,11075);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3216,9) and trade:hasItemQty(11195,1) and trade:getItemCount() == 10) then				--body
		player:addItem(11095);
		player:messageSpecial(ITEM_OBTAINED,11095);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3220,6) and trade:hasItemQty(11215,1) and trade:getItemCount() == 7) then				--hands
		player:addItem(11115);
		player:messageSpecial(ITEM_OBTAINED,11115);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3224,6) and trade:hasItemQty(11235,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11135);
		player:messageSpecial(ITEM_OBTAINED,11135);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3228,6) and trade:hasItemQty(11255,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11155);
		player:messageSpecial(ITEM_OBTAINED,11155);
		player:tradeComplete();
	end
----------------------------NIN-------------------------------------
	if (trade:hasItemQty(3211,6) and trade:hasItemQty(11176,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11076);
		player:messageSpecial(ITEM_OBTAINED,11076);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3214,9) and trade:hasItemQty(11196,1) and trade:getItemCount() == 10) then				--body
		player:addItem(11096);
		player:messageSpecial(ITEM_OBTAINED,11096);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3221,6) and trade:hasItemQty(11216,1) and trade:getItemCount() == 7) then				--hands
		player:addItem(11116);
		player:messageSpecial(ITEM_OBTAINED,11116);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3222,6) and trade:hasItemQty(11236,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11136);
		player:messageSpecial(ITEM_OBTAINED,11136);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3229,6) and trade:hasItemQty(11256,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11156);
		player:messageSpecial(ITEM_OBTAINED,11156);
		player:tradeComplete();
	end
----------------------------DRG-------------------------------------
	if (trade:hasItemQty(3213,6) and trade:hasItemQty(11177,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11077);
		player:messageSpecial(ITEM_OBTAINED,11077);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3217,9) and trade:hasItemQty(11197,1) and trade:getItemCount() == 10) then				--body
		player:addItem(11097);
		player:messageSpecial(ITEM_OBTAINED,11097);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3221,6) and trade:hasItemQty(11217,1) and trade:getItemCount() == 7) then					--hands
		player:addItem(11117);
		player:messageSpecial(ITEM_OBTAINED,11117);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3225,6) and trade:hasItemQty(11237,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11137);
		player:messageSpecial(ITEM_OBTAINED,11137);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3229,6) and trade:hasItemQty(11257,1) and trade:getItemCount() == 7) then			--feet
		player:addItem(11157);
		player:messageSpecial(ITEM_OBTAINED,11157);
		player:tradeComplete();
	end
----------------------------SMN-------------------------------------
	if (trade:hasItemQty(3211,6) and trade:hasItemQty(11178,1) and trade:getItemCount() == 7) then			--head
		player:addItem(11078);
		player:messageSpecial(ITEM_OBTAINED,11078);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3215,9) and trade:hasItemQty(11198,1) and trade:getItemCount() == 10) then			--body
		player:addItem(11098);
		player:messageSpecial(ITEM_OBTAINED,11098);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3220,6) and trade:hasItemQty(11218,1) and trade:getItemCount() == 7) then				--hands
		player:addItem(11118);
		player:messageSpecial(ITEM_OBTAINED,11118);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3225,6) and trade:hasItemQty(11238,1) and trade:getItemCount() == 7) then 					--legs
		player:addItem(11138);
		player:messageSpecial(ITEM_OBTAINED,11138);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3226,6) and trade:hasItemQty(11258,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11158);
		player:messageSpecial(ITEM_OBTAINED,11158);
		player:tradeComplete();
	end
----------------------------BLU-------------------------------------
	if (trade:hasItemQty(3213,6) and trade:hasItemQty(11179,1) and trade:getItemCount() == 7) then			--head
		player:addItem(11079);
		player:messageSpecial(ITEM_OBTAINED,11079);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3214,9) and trade:hasItemQty(11199,1) and trade:getItemCount() == 10) then			--body
		player:addItem(11099);
		player:messageSpecial(ITEM_OBTAINED,11099);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3219,6) and trade:hasItemQty(11219,1) and trade:getItemCount() == 7) then			--hands
		player:addItem(11119);
		player:messageSpecial(ITEM_OBTAINED,11119);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3222,6) and trade:hasItemQty(11239,1) and trade:getItemCount() == 7) then				--legs
		player:addItem(11139);
		player:messageSpecial(ITEM_OBTAINED,11139);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3227,6) and trade:hasItemQty(11259,1) and trade:getItemCount() == 7) then			--feet
		player:addItem(11159);
		player:messageSpecial(ITEM_OBTAINED,11159);
		player:tradeComplete();
	end
----------------------------COR-------------------------------------
	if (trade:hasItemQty(3212,6) and trade:hasItemQty(11180,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11080);
		player:messageSpecial(ITEM_OBTAINED,11080);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3215,9) and trade:hasItemQty(11200,1) and trade:getItemCount() == 10) then			--body
		player:addItem(11100);
		player:messageSpecial(ITEM_OBTAINED,11100);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3221,6) and trade:hasItemQty(11220,1) and trade:getItemCount() == 7) then				--hands
		player:addItem(11120);
		player:messageSpecial(ITEM_OBTAINED,11120);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3225,6) and trade:hasItemQty(11240,1) and trade:getItemCount() == 7) then			--legs
		player:addItem(11140);
		player:messageSpecial(ITEM_OBTAINED,11140);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3227,6) and trade:hasItemQty(11260,1) and trade:getItemCount() == 7) then			--feet
		player:addItem(11160);
		player:messageSpecial(ITEM_OBTAINED,11160);
		player:tradeComplete();
	end
----------------------------PUP-------------------------------------
	if (trade:hasItemQty(3212,6) and trade:hasItemQty(11181,1) and trade:getItemCount() == 7) then			--head
		player:addItem(11081);
		player:messageSpecial(ITEM_OBTAINED,11081);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3216,9) and trade:hasItemQty(11201,1) and trade:getItemCount() == 10) then			--body
		player:addItem(11101);
		player:messageSpecial(ITEM_OBTAINED,11101);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3221,6) and trade:hasItemQty(11221,1) and trade:getItemCount() == 7) then			--hands
		player:addItem(11121);
		player:messageSpecial(ITEM_OBTAINED,11121);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3222,6) and trade:hasItemQty(11241,1) and trade:getItemCount() == 7) then			--legs
		player:addItem(11141);
		player:messageSpecial(ITEM_OBTAINED,11141);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3228,6) and trade:hasItemQty(11261,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11161);
		player:messageSpecial(ITEM_OBTAINED,11161);
		player:tradeComplete();
	end
----------------------------DNC-------------------------------------
	if (trade:hasItemQty(3213,6) and trade:hasItemQty(11182,1) and trade:getItemCount() == 7) then			--head
		player:addItem(11082);
		player:messageSpecial(ITEM_OBTAINED,11082);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3216,9) and trade:hasItemQty(11202,1) and trade:getItemCount() == 10) then			--body
		player:addItem(11102);
		player:messageSpecial(ITEM_OBTAINED,11102);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3219,6) and trade:hasItemQty(11222,1) and trade:getItemCount() == 7) then			--hands
		player:addItem(11122);
		player:messageSpecial(ITEM_OBTAINED,11122);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3225,6) and trade:hasItemQty(11242,1) and trade:getItemCount() == 7) then			--legs
		player:addItem(11142);
		player:messageSpecial(ITEM_OBTAINED,11142);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3226,6) and trade:hasItemQty(11262,1) and trade:getItemCount() == 7) then			--feet
		player:addItem(11162);
		player:messageSpecial(ITEM_OBTAINED,11162);
		player:tradeComplete();
	end
----------------------------SCH-------------------------------------
	if (trade:hasItemQty(3213,6) and trade:hasItemQty(11183,1) and trade:getItemCount() == 7) then				--head
		player:addItem(11083);
		player:messageSpecial(ITEM_OBTAINED,11083);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3217,9) and trade:hasItemQty(11203,1) and trade:getItemCount() == 10) then			--body
		player:addItem(11103);
		player:messageSpecial(ITEM_OBTAINED,11103);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3218,6) and trade:hasItemQty(11223,1) and trade:getItemCount() == 7) then			--hands
		player:addItem(11123);
		player:messageSpecial(ITEM_OBTAINED,11123);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3224,6) and trade:hasItemQty(11243,1) and trade:getItemCount() == 7) then			--legs
		player:addItem(11143);
		player:messageSpecial(ITEM_OBTAINED,11143);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3227,6) and trade:hasItemQty(11263,1) and trade:getItemCount() == 7) then				--feet
		player:addItem(11163);
		player:messageSpecial(ITEM_OBTAINED,11163);
		player:tradeComplete();
	end

---------------------------------------------------EmpyWeapons----------------------------

--------------------------------Almace-------------------------------------
	if (trade:hasItemQty(19399,1) and trade:hasItemQty(2929,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19458);
		player:messageSpecial(ITEM_OBTAINED,19458);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19458,1) and trade:hasItemQty(2964,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19634, 1);
		player:messageSpecial(ITEM_OBTAINED,19634);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19634,1) and trade:hasItemQty(3289,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19807, 1);
		player:messageSpecial(ITEM_OBTAINED,19807);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19807,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20654, 1);
		player:messageSpecial(ITEM_OBTAINED,20654);
		player:tradeComplete();
	end
--------------------------------Armageddon-------------------------------------
	if (trade:hasItemQty(19399,1) and trade:hasItemQty(2930,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19469);
		player:messageSpecial(ITEM_OBTAINED,19469);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19469,1) and trade:hasItemQty(2965,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19645, 1);
		player:messageSpecial(ITEM_OBTAINED,19645);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19645,1) and trade:hasItemQty(3290,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19818, 1);
		player:messageSpecial(ITEM_OBTAINED,19818);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19818,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(21265, 1);
		player:messageSpecial(ITEM_OBTAINED,21265);
		player:tradeComplete();
	end
--------------------------------Caladbolg-------------------------------------
	if (trade:hasItemQty(19400,1) and trade:hasItemQty(2930,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19459);
		player:messageSpecial(ITEM_OBTAINED,19459);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19459,1) and trade:hasItemQty(2965,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19635, 1);
		player:messageSpecial(ITEM_OBTAINED,19635);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19635,1) and trade:hasItemQty(3290,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19808, 1);
		player:messageSpecial(ITEM_OBTAINED,19808);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19808,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20748, 1);
		player:messageSpecial(ITEM_OBTAINED,20748);
		player:tradeComplete();
	end
--------------------------------Daurdabla-------------------------------------
	if (trade:hasItemQty(18574,1) and trade:hasItemQty(2929,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(18575);
		player:messageSpecial(ITEM_OBTAINED,18575);
		player:tradeComplete();
	end
	if (trade:hasItemQty(18575,1) and trade:hasItemQty(2964,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(18576, 1);
		player:messageSpecial(ITEM_OBTAINED,18576);
		player:tradeComplete();
	end
	if (trade:hasItemQty(18576,1) and trade:hasItemQty(3289,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(18571, 1);
		player:messageSpecial(ITEM_OBTAINED,18571);
		player:tradeComplete();
	end
	if (trade:hasItemQty(18571,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(18839, 1);
		player:messageSpecial(ITEM_OBTAINED,18839);
		player:tradeComplete();
	end
--------------------------------Farsha-------------------------------------
	if (trade:hasItemQty(19401,1) and trade:hasItemQty(2931,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19460);
		player:messageSpecial(ITEM_OBTAINED,19460);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19460,1) and trade:hasItemQty(2966,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19636, 1);
		player:messageSpecial(ITEM_OBTAINED,19636);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19636,1) and trade:hasItemQty(3291,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19809, 1);
		player:messageSpecial(ITEM_OBTAINED,19809);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19809,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20795, 1);
		player:messageSpecial(ITEM_OBTAINED,20795);
		player:tradeComplete();
	end
--------------------------------Gambanteinn-------------------------------------
	if (trade:hasItemQty(19407,1) and trade:hasItemQty(2931,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19466);
		player:messageSpecial(ITEM_OBTAINED,19466);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19466,1) and trade:hasItemQty(2966,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19642, 1);
		player:messageSpecial(ITEM_OBTAINED,19642);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19642,1) and trade:hasItemQty(3291,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19815, 1);
		player:messageSpecial(ITEM_OBTAINED,19815);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19815,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(21065, 1);
		player:messageSpecial(ITEM_OBTAINED,21065);
		player:tradeComplete();
	end
--------------------------------Gandiva-------------------------------------
	if (trade:hasItemQty(19409,1) and trade:hasItemQty(2931,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19468);
		player:messageSpecial(ITEM_OBTAINED,19468);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19468,1) and trade:hasItemQty(2966,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19644, 1);
		player:messageSpecial(ITEM_OBTAINED,19644);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19644,1) and trade:hasItemQty(3291,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19817, 1);
		player:messageSpecial(ITEM_OBTAINED,19817);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19817,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(21213, 1);
		player:messageSpecial(ITEM_OBTAINED,21213);
		player:tradeComplete();
	end
--------------------------------Hvergelmir-------------------------------------
	if (trade:hasItemQty(19408,1) and trade:hasItemQty(2932,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19467);
		player:messageSpecial(ITEM_OBTAINED,19467);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19467,1) and trade:hasItemQty(2967,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19643, 1);
		player:messageSpecial(ITEM_OBTAINED,19643);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19643,1) and trade:hasItemQty(3292,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19816, 1);
		player:messageSpecial(ITEM_OBTAINED,19816);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19816,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(21144, 1);
		player:messageSpecial(ITEM_OBTAINED,21144);
		player:tradeComplete();
	end
----------------------------------Kannagi-----------------------------------
	if (trade:hasItemQty(19405,1) and trade:hasItemQty(2929,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19464);
		player:messageSpecial(ITEM_OBTAINED,19464);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19464,1) and trade:hasItemQty(2964,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19640, 1);
		player:messageSpecial(ITEM_OBTAINED,19640);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19640,1) and trade:hasItemQty(3289,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19813, 1);
		player:messageSpecial(ITEM_OBTAINED,19813);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19813,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20975, 1);
		player:messageSpecial(ITEM_OBTAINED,20975);
		player:tradeComplete();
	end
-----------------------------Masamune----------------------------------------
	if (trade:hasItemQty(19406,1) and trade:hasItemQty(2930,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19465);
		player:messageSpecial(ITEM_OBTAINED,19465);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19465,1) and trade:hasItemQty(2965,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(16641, 1);
		player:messageSpecial(ITEM_OBTAINED,16641);
		player:tradeComplete();
	end
	if (trade:hasItemQty(16641,1) and trade:hasItemQty(3290,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19814, 1);
		player:messageSpecial(ITEM_OBTAINED,19814);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19814,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(21020, 1);
		player:messageSpecial(ITEM_OBTAINED,21020);
		player:tradeComplete();
	end
--------------------------------Ochain-------------------------------------
	if (trade:hasItemQty(16192,1) and trade:hasItemQty(2932,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(16193);
		player:messageSpecial(ITEM_OBTAINED,16193);
		player:tradeComplete();
	end
	if (trade:hasItemQty(16193,1) and trade:hasItemQty(2967,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(16194, 1);
		player:messageSpecial(ITEM_OBTAINED,16194);
		player:tradeComplete();
	end
	if (trade:hasItemQty(16194,1) and trade:hasItemQty(3292,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(11926, 1);
		player:messageSpecial(ITEM_OBTAINED,11926);
		player:tradeComplete();
	end
	if (trade:hasItemQty(11926,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(16199, 1);
		player:messageSpecial(ITEM_OBTAINED,16199);
		player:tradeComplete();
	end
--------------------------------Redemption-------------------------------------
	if (trade:hasItemQty(19403,1) and trade:hasItemQty(2928,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19462);
		player:messageSpecial(ITEM_OBTAINED,19462);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19462,1) and trade:hasItemQty(2963,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19638, 1);
		player:messageSpecial(ITEM_OBTAINED,19638);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19638,1) and trade:hasItemQty(3288,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19811, 1);
		player:messageSpecial(ITEM_OBTAINED,19811);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19811,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20885, 1);
		player:messageSpecial(ITEM_OBTAINED,20885);
		player:tradeComplete();
	end
----------------------------Rhongomiant-----------------------------------------
	if (trade:hasItemQty(19404,1) and trade:hasItemQty(2928,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19463);
		player:messageSpecial(ITEM_OBTAINED,19463);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19463,1) and trade:hasItemQty(2963,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19639, 1);
		player:messageSpecial(ITEM_OBTAINED,19639);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19639,1) and trade:hasItemQty(3288,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19812, 1);
		player:messageSpecial(ITEM_OBTAINED,19812);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19812,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20930, 1);
		player:messageSpecial(ITEM_OBTAINED,20930);
		player:tradeComplete();
	end
-------------------------Twashtar--------------------------------------------
	if (trade:hasItemQty(19398,1) and trade:hasItemQty(2927,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19457);
		player:messageSpecial(ITEM_OBTAINED,19457);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19457,1) and trade:hasItemQty(2962,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19633, 1);
		player:messageSpecial(ITEM_OBTAINED,19633);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19633,1) and trade:hasItemQty(3287,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19806, 1);
		player:messageSpecial(ITEM_OBTAINED,19806);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19806,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20564, 1);
		player:messageSpecial(ITEM_OBTAINED,20564);
		player:tradeComplete();
	end
-------------------------Ukonvasara--------------------------------------------
	if (trade:hasItemQty(19402,1) and trade:hasItemQty(2927,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19461);
		player:messageSpecial(ITEM_OBTAINED,19461);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19461,1) and trade:hasItemQty(2962,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19637, 1);
		player:messageSpecial(ITEM_OBTAINED,19637);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19637,1) and trade:hasItemQty(3287,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19810, 1);
		player:messageSpecial(ITEM_OBTAINED,19810);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19810,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20840, 1);
		player:messageSpecial(ITEM_OBTAINED,20840);
		player:tradeComplete();
	end
-------------------------Verethranga--------------------------------------------
	if (trade:hasItemQty(19397,1) and trade:hasItemQty(2927,50) and trade:getItemCount() == 51) then -- 80-85
		player:addItem(19456);
		player:messageSpecial(ITEM_OBTAINED,19456);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19456,1) and trade:hasItemQty(2962,50) and trade:getItemCount() == 51) then -- 85-95
		player:addItem(19632, 1);
		player:messageSpecial(ITEM_OBTAINED,19632);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19632,1) and trade:hasItemQty(3287,50) and trade:getItemCount() == 51) then -- 95-99/1
		player:addItem(19805, 1);
		player:messageSpecial(ITEM_OBTAINED,19805);
		player:tradeComplete();
	end
	if (trade:hasItemQty(19805,1) and trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then -- 99/1-99/4
		player:addItem(20487, 1);
		player:messageSpecial(ITEM_OBTAINED,20487);
		player:tradeComplete();
	end


-------------------------------Relic----------------------------------------------------
----------------------------THF-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15086,1) and trade:getItemCount() == 51) then 		--head
		player:addItem(10664);
		player:messageSpecial(ITEM_OBTAINED,10664);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15092,1) and trade:getItemCount() == 51) then 	-- body
		player:addItem(10675);
		player:messageSpecial(ITEM_OBTAINED,10675);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15107,1) and trade:getItemCount() == 51) then 		--hands
		player:addItem(10695);
		player:messageSpecial(ITEM_OBTAINED,10695);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15122,1) and trade:getItemCount() == 51) then 		--legs
		player:addItem(10715);
		player:messageSpecial(ITEM_OBTAINED,10715);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15137,1) and trade:getItemCount() == 51) then 		--feet
		player:addItem(10735);
		player:messageSpecial(ITEM_OBTAINED,10735);
		player:tradeComplete();
	end
----------------------------WAR-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15072,1) and trade:getItemCount() == 51) then		--head
		player:addItem(10650);
		player:messageSpecial(ITEM_OBTAINED,10650);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15087,1) and trade:getItemCount() == 51) then	     --body
		player:addItem(10670);
		player:messageSpecial(ITEM_OBTAINED,10670);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15102,1) and trade:getItemCount() == 51) then		--hands
		player:addItem(10690);
		player:messageSpecial(ITEM_OBTAINED,10690);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15117,1) and trade:getItemCount() == 51) then 		--legs
		player:addItem(10710);
		player:messageSpecial(ITEM_OBTAINED,10710);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15132,1) and trade:getItemCount() == 51) then		--feet
		player:addItem(10730);
		player:messageSpecial(ITEM_OBTAINED,10730);
		player:tradeComplete();
	end
----------------------------MNK-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15073,1) and trade:getItemCount() == 51) then		--head
		player:addItem(10651);
		player:messageSpecial(ITEM_OBTAINED,10651);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15088,1) and trade:getItemCount() == 51) then		--body
		player:addItem(10671);
		player:messageSpecial(ITEM_OBTAINED,10671);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15103,1) and trade:getItemCount() == 51) then 					--hands
		player:addItem(10691);
		player:messageSpecial(ITEM_OBTAINED,10691);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15118,1) and trade:getItemCount() == 51) then 					--legs
		player:addItem(10711);
		player:messageSpecial(ITEM_OBTAINED,10711);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15133,1) and trade:getItemCount() == 51) then 					--feet
		player:addItem(10731);
		player:messageSpecial(ITEM_OBTAINED,10731);
		player:tradeComplete();
	end
----------------------------WHM-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15074,1) and trade:getItemCount() == 51) then					--head
		player:addItem(10652);
		player:messageSpecial(ITEM_OBTAINED,10652);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15089,1) and trade:getItemCount() == 51) then					--body
		player:addItem(10682);
		player:messageSpecial(ITEM_OBTAINED,10682);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15104,1) and trade:getItemCount() == 51) then					--hands
		player:addItem(10692);
		player:messageSpecial(ITEM_OBTAINED,10692);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15119,1) and trade:getItemCount() == 51) then					--legs
		player:addItem(10712);
		player:messageSpecial(ITEM_OBTAINED,10712);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15134,1) and trade:getItemCount() == 51) then					--feet
		player:addItem(10732);
		player:messageSpecial(ITEM_OBTAINED,10732);
		player:tradeComplete();
	end
----------------------------RDM-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15076,1) and trade:getItemCount() == 51) then					--head
		player:addItem(10654);
		player:messageSpecial(ITEM_OBTAINED,10654);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15091,1) and trade:getItemCount() == 51) then					--body
		player:addItem(10674);
		player:messageSpecial(ITEM_OBTAINED,10674);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15106,1) and trade:getItemCount() == 51) then					--hands
		player:addItem(10694);
		player:messageSpecial(ITEM_OBTAINED,10694);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15121,1) and trade:getItemCount() == 51) then					--legs
		player:addItem(10714);
		player:messageSpecial(ITEM_OBTAINED,10714);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15136,1) and trade:getItemCount() == 51) then					--feet
		player:addItem(10734);
		player:messageSpecial(ITEM_OBTAINED,10734);
		player:tradeComplete();
	end
----------------------------BLM-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15075,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10653);
		player:messageSpecial(ITEM_OBTAINED,10653);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15090,1) and trade:getItemCount() == 51) then				--body
		player:addItem(10673);
		player:messageSpecial(ITEM_OBTAINED,10673);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15105,1) and trade:getItemCount() == 51) then				--hands
		player:addItem(10693);
		player:messageSpecial(ITEM_OBTAINED,10693);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15120,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10713);
		player:messageSpecial(ITEM_OBTAINED,10713);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15135,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10733);
		player:messageSpecial(ITEM_OBTAINED,10733);
		player:tradeComplete();
	end
----------------------------PLD-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15078,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10656);
		player:messageSpecial(ITEM_OBTAINED,10656);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15093,1) and trade:getItemCount() == 51) then				--body
		player:addItem(10676);
		player:messageSpecial(ITEM_OBTAINED,10676);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15108,1) and trade:getItemCount() == 51) then				--hands
		player:addItem(10698);
		player:messageSpecial(ITEM_OBTAINED,10698);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15123,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10716);
		player:messageSpecial(ITEM_OBTAINED,10716);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15138,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10736);
		player:messageSpecial(ITEM_OBTAINED,10736);
		player:tradeComplete();
	end
----------------------------DRK-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15079,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10657);
		player:messageSpecial(ITEM_OBTAINED,10657);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15094,1) and trade:getItemCount() == 51) then				--body
		player:addItem(10677);
		player:messageSpecial(ITEM_OBTAINED,10677);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15109,1) and trade:getItemCount() == 51) then				--hands
		player:addItem(10697);
		player:messageSpecial(ITEM_OBTAINED,10697);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15124,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10717);
		player:messageSpecial(ITEM_OBTAINED,10717);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15139,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10737);
		player:messageSpecial(ITEM_OBTAINED,10737);
		player:tradeComplete();
	end
----------------------------BST-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15080,1) and trade:getItemCount() == 51) then					--head
		player:addItem(10658);
		player:messageSpecial(ITEM_OBTAINED,10658);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15095,1) and trade:getItemCount() == 51) then					--body
		player:addItem(10678);
		player:messageSpecial(ITEM_OBTAINED,10678);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15110,1) and trade:getItemCount() == 51) then					--hands
		player:addItem(10698);
		player:messageSpecial(ITEM_OBTAINED,10698);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15125,1) and trade:getItemCount() == 51) then					--legs
		player:addItem(10718);
		player:messageSpecial(ITEM_OBTAINED,10718);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15140,1) and trade:getItemCount() == 51) then					--feet
		player:addItem(10738);
		player:messageSpecial(ITEM_OBTAINED,10738);
		player:tradeComplete();
	end
----------------------------BRD-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15081,1) and trade:getItemCount() == 51) then					--head
		player:addItem(10659);
		player:messageSpecial(ITEM_OBTAINED,10659);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15096,1) and trade:getItemCount() == 51) then					--body
		player:addItem(10679);
		player:messageSpecial(ITEM_OBTAINED,10679);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15111,1) and trade:getItemCount() == 51) then					--hands
		player:addItem(10699);
		player:messageSpecial(ITEM_OBTAINED,10699);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15126,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10719);
		player:messageSpecial(ITEM_OBTAINED,10719);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15141,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10739);
		player:messageSpecial(ITEM_OBTAINED,10739);
		player:tradeComplete();
	end
----------------------------RNG-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15082,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10660);
		player:messageSpecial(ITEM_OBTAINED,10660);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15097,1) and trade:getItemCount() == 51) then	    		--body
		player:addItem(10680);
		player:messageSpecial(ITEM_OBTAINED,10680);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15112,1) and trade:getItemCount() == 51) then				--hands
		player:addItem(10700);
		player:messageSpecial(ITEM_OBTAINED,10700);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15127,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10720);
		player:messageSpecial(ITEM_OBTAINED,10720);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15142,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10740);
		player:messageSpecial(ITEM_OBTAINED,10740);
		player:tradeComplete();
	end
----------------------------SAM-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15083,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10661);
		player:messageSpecial(ITEM_OBTAINED,10661);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15098,1) and trade:getItemCount() == 51) then				--body
		player:addItem(10681);
		player:messageSpecial(ITEM_OBTAINED,10681);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15113,1) and trade:getItemCount() == 51) then				--hands
		player:addItem(10701);
		player:messageSpecial(ITEM_OBTAINED,10701);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15128,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10721);
		player:messageSpecial(ITEM_OBTAINED,10721);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15143,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10741);
		player:messageSpecial(ITEM_OBTAINED,10741);
		player:tradeComplete();
	end
----------------------------NIN-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15084,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10662);
		player:messageSpecial(ITEM_OBTAINED,10662);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(16099,1) and trade:getItemCount() == 51) then				--body
		player:addItem(10682);
		player:messageSpecial(ITEM_OBTAINED,10682);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15114,1) and trade:getItemCount() == 51) then				--hands
		player:addItem(10702);
		player:messageSpecial(ITEM_OBTAINED,10702);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15129,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10722);
		player:messageSpecial(ITEM_OBTAINED,10722);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15144,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10742);
		player:messageSpecial(ITEM_OBTAINED,10742);
		player:tradeComplete();
	end
----------------------------DRG-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15085,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10663);
		player:messageSpecial(ITEM_OBTAINED,10663);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15100,1) and trade:getItemCount() == 51) then				--body
		player:addItem(10683);
		player:messageSpecial(ITEM_OBTAINED,10683);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15115,1) and trade:getItemCount() == 51) then					--hands
		player:addItem(10703);
		player:messageSpecial(ITEM_OBTAINED,10703);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15130,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10723);
		player:messageSpecial(ITEM_OBTAINED,10723);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15145,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10743);
		player:messageSpecial(ITEM_OBTAINED,10743);
		player:tradeComplete();
	end
----------------------------SMN-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(15086,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10664);
		player:messageSpecial(ITEM_OBTAINED,10664);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(15101,1) and trade:getItemCount() == 51) then				--body
		player:addItem(10684);
		player:messageSpecial(ITEM_OBTAINED,10684);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15116,1) and trade:getItemCount() == 51) then				--hands
		player:addItem(10704);
		player:messageSpecial(ITEM_OBTAINED,10704);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(15131,1) and trade:getItemCount() == 51) then 					--legs
		player:addItem(10724);
		player:messageSpecial(ITEM_OBTAINED,10724);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(15146,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10744);
		player:messageSpecial(ITEM_OBTAINED,10744);
		player:tradeComplete();
	end
----------------------------BLU-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(11465,1) and trade:getItemCount() == 51) then			--head
		player:addItem(10665);
		player:messageSpecial(ITEM_OBTAINED,10665);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(11292,1) and trade:getItemCount() == 51) then			--body
		player:addItem(10685);
		player:messageSpecial(ITEM_OBTAINED,10685);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15025,1) and trade:getItemCount() == 51) then			--hands
		player:addItem(10705);
		player:messageSpecial(ITEM_OBTAINED,10705);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(16346,1) and trade:getItemCount() == 51) then				--legs
		player:addItem(10725);
		player:messageSpecial(ITEM_OBTAINED,10725);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(11382,1) and trade:getItemCount() == 51) then			--feet
		player:addItem(10745);
		player:messageSpecial(ITEM_OBTAINED,10745);
		player:tradeComplete();
	end
----------------------------COR-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(11468,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10666);
		player:messageSpecial(ITEM_OBTAINED,10666);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(11295,1) and trade:getItemCount() == 51) then			--body
		player:addItem(10686);
		player:messageSpecial(ITEM_OBTAINED,10686);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15028,1) and trade:getItemCount() == 51) then				--hands
		player:addItem(10706);
		player:messageSpecial(ITEM_OBTAINED,10706);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(16349,1) and trade:getItemCount() == 51) then			--legs
		player:addItem(10726);
		player:messageSpecial(ITEM_OBTAINED,10726);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(11385,1) and trade:getItemCount() == 51) then			--feet
		player:addItem(10746);
		player:messageSpecial(ITEM_OBTAINED,10746);
		player:tradeComplete();
	end

----------------------------DNC-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(11478,1) and trade:getItemCount() == 51) then			--head
		player:addItem(10668);
		player:messageSpecial(ITEM_OBTAINED,10668);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(11305,1) and trade:getItemCount() == 51) then			--body
		player:addItem(10688);
		player:messageSpecial(ITEM_OBTAINED,10688);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15038,1) and trade:getItemCount() == 51) then			--hands
		player:addItem(10708);
		player:messageSpecial(ITEM_OBTAINED,10708);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(16360,1) and trade:getItemCount() == 51) then			--legs
		player:addItem(10728);
		player:messageSpecial(ITEM_OBTAINED,10728);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(11396,1) and trade:getItemCount() == 51) then			--feet
		player:addItem(10748);
		player:messageSpecial(ITEM_OBTAINED,10748);
		player:tradeComplete();
	end
----------------------------SCH-------------------------------------
	if (trade:hasItemQty(3493,50) and trade:hasItemQty(11480,1) and trade:getItemCount() == 51) then				--head
		player:addItem(10669);
		player:messageSpecial(ITEM_OBTAINED,10669);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3494,50) and trade:hasItemQty(11307,1) and trade:getItemCount() == 51) then			--body
		player:addItem(10689);
		player:messageSpecial(ITEM_OBTAINED,10689);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3495,50) and trade:hasItemQty(15040,1) and trade:getItemCount() == 51) then			--hands
		player:addItem(10709);
		player:messageSpecial(ITEM_OBTAINED,10709);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3496,50) and trade:hasItemQty(16362,1) and trade:getItemCount() == 51) then			--legs
		player:addItem(10729);
		player:messageSpecial(ITEM_OBTAINED,10729);
		player:tradeComplete();
	end
	if (trade:hasItemQty(3497,50) and trade:hasItemQty(11398,1) and trade:getItemCount() == 51) then				--feet
		player:addItem(10749);
		player:messageSpecial(ITEM_OBTAINED,10749);
		player:tradeComplete();
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:SpoofChatPlayer( (string.format( "Hello %s!, I'm here to help you upgrade your AF3, Salvage, Relic, and Empyrean Weapons", player:getName() )), MESSAGE_SAY, npc:getID() );
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