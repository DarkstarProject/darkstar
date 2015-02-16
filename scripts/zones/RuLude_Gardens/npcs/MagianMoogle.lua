-----------------------------------
-- Area: Rulude Gardens
-- NPC:  MagianMoogle
-----------------------------------
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/npc_util");
require("scripts/globals/settings");
require("scripts/commands/additem");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

-- -------------------------------AF3 trade -------------------------------
-- +1 --
	----------------------------THF-------------------------------------
  
	if (trade:hasItemQty(11169,1) and trade:hasItemQty(3115,8) and trade:getItemCount() == 9) then 	--head		    		
        player:addItem(11069);
        player:messageSpecial(ITEM_OBTAINED,11069);
		player:tradeComplete();
		player:startEvent(10125);		
    end
	if (trade:hasItemQty(12033,1) and (trade:hasItemQty(3135,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11089, 1);
		player:messageSpecial(ITEM_OBTAINED,11089);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12053,1) and (trade:hasItemQty(3155,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11109, 1);
		player:messageSpecial(ITEM_OBTAINED,11109);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12073,1) and (trade:hasItemQty(3175,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11149, 1);
		player:messageSpecial(ITEM_OBTAINED,11149);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12093,1) and (trade:hasItemQty(3195,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11129, 1);
		player:messageSpecial(ITEM_OBTAINED,11129);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------WAR-------------------------------------
    if (trade:hasItemQty(12008,1) and (trade:hasItemQty(3110,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11064, 1);
		player:messageSpecial(ITEM_OBTAINED,11064);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12028,1) and (trade:hasItemQty(3130,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11084, 1);
		player:messageSpecial(ITEM_OBTAINED,11084);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12048,1) and (trade:hasItemQty(3150,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11104, 1);
		player:messageSpecial(ITEM_OBTAINED,11104);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12068,1) and (trade:hasItemQty(3170,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11124, 1);
		player:messageSpecial(ITEM_OBTAINED,11124);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12088,1) and (trade:hasItemQty(3190,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11144, 1);
		player:messageSpecial(ITEM_OBTAINED,11144);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------MNK-------------------------------------
    if (trade:hasItemQty(12009,1) and (trade:hasItemQty(3111,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11065, 1);
		player:messageSpecial(ITEM_OBTAINED,11065);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12029,1) and (trade:hasItemQty(3131,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11085, 1);
		player:messageSpecial(ITEM_OBTAINED,11085);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12049,1) and (trade:hasItemQty(3151,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11105, 1);
		player:messageSpecial(ITEM_OBTAINED,11105);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12069,1) and (trade:hasItemQty(3171,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11125, 1);
		player:messageSpecial(ITEM_OBTAINED,11125);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12089,1) and (trade:hasItemQty(3191,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11145, 1);
		player:messageSpecial(ITEM_OBTAINED,11145);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------WHM-------------------------------------
    if (trade:hasItemQty(12010,1) and (trade:hasItemQty(3112,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11066, 1);
		player:messageSpecial(ITEM_OBTAINED,11066);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12030,1) and (trade:hasItemQty(3132,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11086, 1);
		player:messageSpecial(ITEM_OBTAINED,11086);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12050,1) and (trade:hasItemQty(3152,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11106, 1);
		player:messageSpecial(ITEM_OBTAINED,11106);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12070,1) and (trade:hasItemQty(3172,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11126, 1);
		player:messageSpecial(ITEM_OBTAINED,11126);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12090,1) and (trade:hasItemQty(3192,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11146, 1);
		player:messageSpecial(ITEM_OBTAINED,11146);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------RDM-------------------------------------
    if (trade:hasItemQty(12012,1) and (trade:hasItemQty(3114,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11068, 1);
		player:messageSpecial(ITEM_OBTAINED,11068);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12032,1) and (trade:hasItemQty(3134,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11088, 1);
		player:messageSpecial(ITEM_OBTAINED,11088);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12052,1) and (trade:hasItemQty(3154,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11108, 1);
		player:messageSpecial(ITEM_OBTAINED,11108);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12072,1) and (trade:hasItemQty(3174,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11128, 1);
		player:messageSpecial(ITEM_OBTAINED,11128);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12092,1) and (trade:hasItemQty(3194,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11148, 1);
		player:messageSpecial(ITEM_OBTAINED,11148);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------BLM-------------------------------------
    if (trade:hasItemQty(12011,1) and (trade:hasItemQty(3113,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11067, 1);
		player:messageSpecial(ITEM_OBTAINED,11067);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12031,1) and (trade:hasItemQty(3133,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11087, 1);
		player:messageSpecial(ITEM_OBTAINED,11087);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12051,1) and (trade:hasItemQty(3153,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11107, 1);
		player:messageSpecial(ITEM_OBTAINED,11107);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12071,1) and (trade:hasItemQty(3173,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11127, 1);
		player:messageSpecial(ITEM_OBTAINED,11127);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12091,1) and (trade:hasItemQty(3193,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11147, 1);
		player:messageSpecial(ITEM_OBTAINED,11147);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------PLD-------------------------------------
    if (trade:hasItemQty(12014,1) and (trade:hasItemQty(3116,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11070, 1);
		player:messageSpecial(ITEM_OBTAINED,11070);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12034,1) and (trade:hasItemQty(3136,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11090, 1);
		player:messageSpecial(ITEM_OBTAINED,11090);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12054,1) and (trade:hasItemQty(3156,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11110, 1);
		player:messageSpecial(ITEM_OBTAINED,11110);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12074,1) and (trade:hasItemQty(3176,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11130, 1);
		player:messageSpecial(ITEM_OBTAINED,11130);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12094,1) and (trade:hasItemQty(3196,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11150, 1);
		player:messageSpecial(ITEM_OBTAINED,11150);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------DRK-------------------------------------
    if (trade:hasItemQty(12015,1) and (trade:hasItemQty(3117,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11071, 1);
		player:messageSpecial(ITEM_OBTAINED,11071);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12035,1) and (trade:hasItemQty(3137,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11091, 1);
		player:messageSpecial(ITEM_OBTAINED,11091);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12055,1) and (trade:hasItemQty(3157,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11111, 1);
		player:messageSpecial(ITEM_OBTAINED,11111);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12075,1) and (trade:hasItemQty(3177,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11131, 1);
		player:messageSpecial(ITEM_OBTAINED,11131);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12095,1) and (trade:hasItemQty(3197,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11151, 1);
		player:messageSpecial(ITEM_OBTAINED,11151);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------BST-------------------------------------
    if (trade:hasItemQty(12016,1) and (trade:hasItemQty(3118,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11072, 1);
		player:messageSpecial(ITEM_OBTAINED,11072);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12036,1) and (trade:hasItemQty(3138,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11092, 1);
		player:messageSpecial(ITEM_OBTAINED,11092);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12056,1) and (trade:hasItemQty(3158,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11112, 1);
		player:messageSpecial(ITEM_OBTAINED,11112);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12076,1) and (trade:hasItemQty(3178,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11132, 1);
		player:messageSpecial(ITEM_OBTAINED,11132);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12096,1) and (trade:hasItemQty(3198,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11152, 1);
		player:messageSpecial(ITEM_OBTAINED,11152);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------BRD-------------------------------------
    if (trade:hasItemQty(12017,1) and (trade:hasItemQty(3119,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11073, 1);
		player:messageSpecial(ITEM_OBTAINED,11073);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12037,1) and (trade:hasItemQty(3139,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11093, 1);
		player:messageSpecial(ITEM_OBTAINED,11093);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12057,1) and (trade:hasItemQty(3159,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11113, 1);
		player:messageSpecial(ITEM_OBTAINED,11113);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12077,1) and (trade:hasItemQty(3179,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11133, 1);
		player:messageSpecial(ITEM_OBTAINED,11133);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12097,1) and (trade:hasItemQty(3199,8) and trade:getItemCount() == 8) then 					--feet
		player:addItem(11153, 1);
		player:messageSpecial(ITEM_OBTAINED,11153);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------RNG-------------------------------------
    if (trade:hasItemQty(12018,1) and (trade:hasItemQty(3120,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11074, 1);
		player:messageSpecial(ITEM_OBTAINED,11074);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12038,1) and (trade:hasItemQty(3140,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11094, 1);
		player:messageSpecial(ITEM_OBTAINED,11094);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12058,1) and (trade:hasItemQty(3160,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11114, 1);
		player:messageSpecial(ITEM_OBTAINED,11114);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12078,1) and (trade:hasItemQty(3180,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11134, 1);
		player:messageSpecial(ITEM_OBTAINED,11134);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12098,1) and (trade:hasItemQty(3200,1) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11154, 1);
		player:messageSpecial(ITEM_OBTAINED,11154);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------SAM-------------------------------------
    if (trade:hasItemQty(12019,1) and (trade:hasItemQty(3121,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11075, 1);
		player:messageSpecial(ITEM_OBTAINED,11075);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12039,1) and (trade:hasItemQty(3141,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11095, 1);
		player:messageSpecial(ITEM_OBTAINED,11095);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12059,1) and (trade:hasItemQty(3161,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11115, 1);
		player:messageSpecial(ITEM_OBTAINED,11115);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12079,1) and (trade:hasItemQty(3181,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11135, 1);
		player:messageSpecial(ITEM_OBTAINED,11135);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12099,1) and (trade:hasItemQty(3201,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11155, 1);
		player:messageSpecial(ITEM_OBTAINED,11155);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------NIN-------------------------------------
    if (trade:hasItemQty(12020,1) and (trade:hasItemQty(3122,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11076, 1);
		player:messageSpecial(ITEM_OBTAINED,11076);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12040,1) and (trade:hasItemQty(3142,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11096, 1);
		player:messageSpecial(ITEM_OBTAINED,11096);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12060,1) and (trade:hasItemQty(3162,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11116, 1);
		player:messageSpecial(ITEM_OBTAINED,11116);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12080,1) and (trade:hasItemQty(3182,8) and trade:getItemCount() == 9) then 					--legs
		player:addItem(11136, 1);
		player:messageSpecial(ITEM_OBTAINED,11136);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12100,1) and (trade:hasItemQty(3202,8) and trade:getItemCount() == 9) then 					--feet
		player:addItem(11156, 1);
		player:messageSpecial(ITEM_OBTAINED,11156);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------DRG-------------------------------------
    if (trade:hasItemQty(12021,1) and (trade:hasItemQty(3123,8) and trade:getItemCount() == 9) then 					--head
		player:addItem(11077, 1);
		player:messageSpecial(ITEM_OBTAINED,11077);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12041,1) and (trade:hasItemQty(3143,10) and trade:getItemCount() == 11) then 					--body
		player:addItem(11097, 1);
		player:messageSpecial(ITEM_OBTAINED,11097);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(12061,1) and (trade:hasItemQty(3163,8) and trade:getItemCount() == 9) then 					--hands
		player:addItem(11117, 1);
		player:messageSpecial(ITEM_OBTAINED,11117);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12081,1) and (trade:hasItemQty(3183,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11137, 1);
		player:messageSpecial(ITEM_OBTAINED,11137);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(12101,1) and (trade:hasItemQty(3203,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11157, 1);
		player:messageSpecial(ITEM_OBTAINED,11157);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------SMN-------------------------------------
    if (trade:hasItemQty(3124,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11078, 1);
		player:messageSpecial(ITEM_OBTAINED,11078);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3144,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11098, 1);
		player:messageSpecial(ITEM_OBTAINED,11098);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3164,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11118, 1);
		player:messageSpecial(ITEM_OBTAINED,11118);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3184,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11138, 1);
		player:messageSpecial(ITEM_OBTAINED,11138);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3204,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11158, 1);
		player:messageSpecial(ITEM_OBTAINED,11158);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------BLU-------------------------------------
    if (trade:hasItemQty(3125,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11079, 1);
		player:messageSpecial(ITEM_OBTAINED,11079);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3145,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11099, 1);
		player:messageSpecial(ITEM_OBTAINED,11099);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3165,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11119, 1);
		player:messageSpecial(ITEM_OBTAINED,11119);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3185,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11139, 1);
		player:messageSpecial(ITEM_OBTAINED,11139);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3205,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11159, 1);
		player:messageSpecial(ITEM_OBTAINED,11159);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------COR-------------------------------------
    if (trade:hasItemQty(3126,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11080, 1);
		player:messageSpecial(ITEM_OBTAINED,11080);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3146,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11100, 1);
		player:messageSpecial(ITEM_OBTAINED,11100);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3166,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11120, 1);
		player:messageSpecial(ITEM_OBTAINED,11120);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3186,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11140, 1);
		player:messageSpecial(ITEM_OBTAINED,11140);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3206,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11160, 1);
		player:messageSpecial(ITEM_OBTAINED,11160);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------PUP-------------------------------------
    if (trade:hasItemQty(3127,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11081, 1);
		player:messageSpecial(ITEM_OBTAINED,11081);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3147,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11101, 1);
		player:messageSpecial(ITEM_OBTAINED,11101);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3167,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11121, 1);
		player:messageSpecial(ITEM_OBTAINED,11121);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3187,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11141, 1);
		player:messageSpecial(ITEM_OBTAINED,11141);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3207,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11161, 1);
		player:messageSpecial(ITEM_OBTAINED,11161);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------DNC-------------------------------------
    if (trade:hasItemQty(3128,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11082, 1);
		player:messageSpecial(ITEM_OBTAINED,11082);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3148,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11102, 1);
		player:messageSpecial(ITEM_OBTAINED,11102);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3168,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11122, 1);
		player:messageSpecial(ITEM_OBTAINED,11122);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3188,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11142, 1);
		player:messageSpecial(ITEM_OBTAINED,11142);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3208,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11162, 1);
		player:messageSpecial(ITEM_OBTAINED,11162);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------SCH-------------------------------------
    if (trade:hasItemQty(3129,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11083, 1);
		player:messageSpecial(ITEM_OBTAINED,11083);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3149,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11103, 1);
		player:messageSpecial(ITEM_OBTAINED,11103);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3169,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11123, 1);
		player:messageSpecial(ITEM_OBTAINED,11123);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3189,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11143, 1);
		player:messageSpecial(ITEM_OBTAINED,11143);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3209,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11163, 1);
		player:messageSpecial(ITEM_OBTAINED,11163);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	
-- +2 --
	----------------------------THF-------------------------------------
  
	if (trade:hasItemQty(11169,1) and trade:hasItemQty(3115,8) and trade:getItemCount() == 9) then 	--head		    		
        player:addItem(11069);
        player:messageSpecial(ITEM_OBTAINED,11069);
		player:tradeComplete();
		player:startEvent(10125);		
    end
	if (trade:hasItemQty(3135,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11089, 1);
		player:messageSpecial(ITEM_OBTAINED,11089);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3155,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11109, 1);
		player:messageSpecial(ITEM_OBTAINED,11109);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3175,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11149, 1);
		player:messageSpecial(ITEM_OBTAINED,11149);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3195,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11129, 1);
		player:messageSpecial(ITEM_OBTAINED,11129);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------WAR-------------------------------------
    if (trade:hasItemQty(3110,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11064, 1);
		player:messageSpecial(ITEM_OBTAINED,11064);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3130,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11084, 1);
		player:messageSpecial(ITEM_OBTAINED,11084);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3150,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11104, 1);
		player:messageSpecial(ITEM_OBTAINED,11104);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3170,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11124, 1);
		player:messageSpecial(ITEM_OBTAINED,11124);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3190,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11144, 1);
		player:messageSpecial(ITEM_OBTAINED,11144);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------MNK-------------------------------------
    if (trade:hasItemQty(3111,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11065, 1);
		player:messageSpecial(ITEM_OBTAINED,11065);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3131,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11085, 1);
		player:messageSpecial(ITEM_OBTAINED,11085);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3151,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11105, 1);
		player:messageSpecial(ITEM_OBTAINED,11105);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3171,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11125, 1);
		player:messageSpecial(ITEM_OBTAINED,11125);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3191,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11145, 1);
		player:messageSpecial(ITEM_OBTAINED,11145);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------WHM-------------------------------------
    if (trade:hasItemQty(3112,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11066, 1);
		player:messageSpecial(ITEM_OBTAINED,11066);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3132,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11086, 1);
		player:messageSpecial(ITEM_OBTAINED,11086);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3152,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11106, 1);
		player:messageSpecial(ITEM_OBTAINED,11106);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3172,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11126, 1);
		player:messageSpecial(ITEM_OBTAINED,11126);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3192,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11146, 1);
		player:messageSpecial(ITEM_OBTAINED,11146);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------RDM-------------------------------------
    if (trade:hasItemQty(3114,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11068, 1);
		player:messageSpecial(ITEM_OBTAINED,11068);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3134,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11088, 1);
		player:messageSpecial(ITEM_OBTAINED,11088);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3154,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11108, 1);
		player:messageSpecial(ITEM_OBTAINED,11108);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3174,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11128, 1);
		player:messageSpecial(ITEM_OBTAINED,11128);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3194,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11148, 1);
		player:messageSpecial(ITEM_OBTAINED,11148);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------BLM-------------------------------------
    if (trade:hasItemQty(3113,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11067, 1);
		player:messageSpecial(ITEM_OBTAINED,11067);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3133,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11087, 1);
		player:messageSpecial(ITEM_OBTAINED,11087);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3153,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11107, 1);
		player:messageSpecial(ITEM_OBTAINED,11107);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3173,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11127, 1);
		player:messageSpecial(ITEM_OBTAINED,11127);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3193,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11147, 1);
		player:messageSpecial(ITEM_OBTAINED,11147);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------PLD-------------------------------------
    if (trade:hasItemQty(3116,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11070, 1);
		player:messageSpecial(ITEM_OBTAINED,11070);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3136,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11090, 1);
		player:messageSpecial(ITEM_OBTAINED,11090);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3156,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11110, 1);
		player:messageSpecial(ITEM_OBTAINED,11110);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3176,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11130, 1);
		player:messageSpecial(ITEM_OBTAINED,11130);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3196,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11150, 1);
		player:messageSpecial(ITEM_OBTAINED,11150);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------DRK-------------------------------------
    if (trade:hasItemQty(3117,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11071, 1);
		player:messageSpecial(ITEM_OBTAINED,11071);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3137,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11091, 1);
		player:messageSpecial(ITEM_OBTAINED,11091);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3157,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11111, 1);
		player:messageSpecial(ITEM_OBTAINED,11111);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3177,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11131, 1);
		player:messageSpecial(ITEM_OBTAINED,11131);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3197,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11151, 1);
		player:messageSpecial(ITEM_OBTAINED,11151);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------BST-------------------------------------
    if (trade:hasItemQty(3118,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11072, 1);
		player:messageSpecial(ITEM_OBTAINED,11072);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3138,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11092, 1);
		player:messageSpecial(ITEM_OBTAINED,11092);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3158,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11112, 1);
		player:messageSpecial(ITEM_OBTAINED,11112);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3178,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11132, 1);
		player:messageSpecial(ITEM_OBTAINED,11132);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3198,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11152, 1);
		player:messageSpecial(ITEM_OBTAINED,11152);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------BRD-------------------------------------
    if (trade:hasItemQty(3119,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11073, 1);
		player:messageSpecial(ITEM_OBTAINED,11073);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3139,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11093, 1);
		player:messageSpecial(ITEM_OBTAINED,11093);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3159,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11113, 1);
		player:messageSpecial(ITEM_OBTAINED,11113);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3179,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11133, 1);
		player:messageSpecial(ITEM_OBTAINED,11133);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3199,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11153, 1);
		player:messageSpecial(ITEM_OBTAINED,11153);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------RNG-------------------------------------
    if (trade:hasItemQty(3120,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11074, 1);
		player:messageSpecial(ITEM_OBTAINED,11074);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3140,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11094, 1);
		player:messageSpecial(ITEM_OBTAINED,11094);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3160,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11114, 1);
		player:messageSpecial(ITEM_OBTAINED,11114);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3180,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11134, 1);
		player:messageSpecial(ITEM_OBTAINED,11134);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3200,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11154, 1);
		player:messageSpecial(ITEM_OBTAINED,11154);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------SAM-------------------------------------
    if (trade:hasItemQty(3121,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11075, 1);
		player:messageSpecial(ITEM_OBTAINED,11075);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3141,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11095, 1);
		player:messageSpecial(ITEM_OBTAINED,11095);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3161,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11115, 1);
		player:messageSpecial(ITEM_OBTAINED,11115);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3181,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11135, 1);
		player:messageSpecial(ITEM_OBTAINED,11135);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3201,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11155, 1);
		player:messageSpecial(ITEM_OBTAINED,11155);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------NIN-------------------------------------
    if (trade:hasItemQty(3122,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11076, 1);
		player:messageSpecial(ITEM_OBTAINED,11076);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3142,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11096, 1);
		player:messageSpecial(ITEM_OBTAINED,11096);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3162,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11116, 1);
		player:messageSpecial(ITEM_OBTAINED,11116);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3182,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11136, 1);
		player:messageSpecial(ITEM_OBTAINED,11136);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3202,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11156, 1);
		player:messageSpecial(ITEM_OBTAINED,11156);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------DRG-------------------------------------
    if (trade:hasItemQty(3123,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11077, 1);
		player:messageSpecial(ITEM_OBTAINED,11077);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3143,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11097, 1);
		player:messageSpecial(ITEM_OBTAINED,11097);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3163,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11117, 1);
		player:messageSpecial(ITEM_OBTAINED,11117);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3183,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11137, 1);
		player:messageSpecial(ITEM_OBTAINED,11137);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3203,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11157, 1);
		player:messageSpecial(ITEM_OBTAINED,11157);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------SMN-------------------------------------
    if (trade:hasItemQty(3124,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11078, 1);
		player:messageSpecial(ITEM_OBTAINED,11078);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3144,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11098, 1);
		player:messageSpecial(ITEM_OBTAINED,11098);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3164,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11118, 1);
		player:messageSpecial(ITEM_OBTAINED,11118);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3184,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11138, 1);
		player:messageSpecial(ITEM_OBTAINED,11138);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3204,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11158, 1);
		player:messageSpecial(ITEM_OBTAINED,11158);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------BLU-------------------------------------
    if (trade:hasItemQty(3125,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11079, 1);
		player:messageSpecial(ITEM_OBTAINED,11079);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3145,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11099, 1);
		player:messageSpecial(ITEM_OBTAINED,11099);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3165,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11119, 1);
		player:messageSpecial(ITEM_OBTAINED,11119);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3185,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11139, 1);
		player:messageSpecial(ITEM_OBTAINED,11139);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3205,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11159, 1);
		player:messageSpecial(ITEM_OBTAINED,11159);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------COR-------------------------------------
    if (trade:hasItemQty(3126,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11080, 1);
		player:messageSpecial(ITEM_OBTAINED,11080);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3146,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11100, 1);
		player:messageSpecial(ITEM_OBTAINED,11100);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3166,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11120, 1);
		player:messageSpecial(ITEM_OBTAINED,11120);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3186,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11140, 1);
		player:messageSpecial(ITEM_OBTAINED,11140);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3206,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11160, 1);
		player:messageSpecial(ITEM_OBTAINED,11160);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------PUP-------------------------------------
    if (trade:hasItemQty(3127,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11081, 1);
		player:messageSpecial(ITEM_OBTAINED,11081);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3147,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11101, 1);
		player:messageSpecial(ITEM_OBTAINED,11101);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3167,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11121, 1);
		player:messageSpecial(ITEM_OBTAINED,11121);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3187,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11141, 1);
		player:messageSpecial(ITEM_OBTAINED,11141);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3207,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11161, 1);
		player:messageSpecial(ITEM_OBTAINED,11161);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------DNC-------------------------------------
    if (trade:hasItemQty(3128,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11082, 1);
		player:messageSpecial(ITEM_OBTAINED,11082);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3148,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11102, 1);
		player:messageSpecial(ITEM_OBTAINED,11102);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3168,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11122, 1);
		player:messageSpecial(ITEM_OBTAINED,11122);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3188,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11142, 1);
		player:messageSpecial(ITEM_OBTAINED,11142);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3208,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11162, 1);
		player:messageSpecial(ITEM_OBTAINED,11162);
	    player:tradeComplete();
		player:startEvent(10125);
    end
----------------------------SCH-------------------------------------
    if (trade:hasItemQty(3129,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11083, 1);
		player:messageSpecial(ITEM_OBTAINED,11083);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3149,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11103, 1);
		player:messageSpecial(ITEM_OBTAINED,11103);
	    player:tradeComplete();
		player:startEvent(10125);
	end
	if (trade:hasItemQty(3169,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11123, 1);
		player:messageSpecial(ITEM_OBTAINED,11123);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3189,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11143, 1);
		player:messageSpecial(ITEM_OBTAINED,11143);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(3209,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11163, 1);
		player:messageSpecial(ITEM_OBTAINED,11163);
	    player:tradeComplete();
		player:startEvent(10125);
    end
-------------------------------------Almace-------------------------------------
	if (trade:hasItemQty(19399,1) and trade:hasItemQty(2929,50) and trade:getItemCount() == 51) then 	--80-85	    		
        player:addItem(19458);
        player:messageSpecial(ITEM_OBTAINED,19458);
		player:tradeComplete();
		player:startEvent(10125);		
    end
	if (trade:hasItemQty(19458,1) and (trade:hasItemQty(2964,50) and trade:getItemCount() == 51) then 	--85-95
		player:addItem(19634, 1);
		player:messageSpecial(ITEM_OBTAINED,19634);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(19634,1) and (trade:hasItemQty(3289,50) and trade:getItemCount() == 51) then  --95-99/1
		player:addItem(19807, 1);
		player:messageSpecial(ITEM_OBTAINED,19807);
	    player:tradeComplete();
		player:startEvent(10125);
    end
	if (trade:hasItemQty(19807,1) and (trade:hasItemQty(3925,50) and trade:getItemCount() == 51) then --99/1-99/4
		player:addItem(20654, 1);
		player:messageSpecial(ITEM_OBTAINED,20654);
	    player:tradeComplete();
		player:startEvent(10125);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
end;



function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("updateRESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------
function onEventFinish(player,csid,option)	
--printf("CSID: %u",csid);
--printf("finishRESULT: %u",option);
    if (csid == 10125) then
	    player:setAnimation( ACTION_DANCE );
	end	
end;	