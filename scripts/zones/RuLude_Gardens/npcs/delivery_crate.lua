-----------------------------------
-- Area: Rulude Gardens
-- NPC:  delivery crate
-----------------------------------
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/npc_util");
require("scripts/globals/settings");
require("scripts/commands/additem");
package.loaded["scripts/zones/Rulude_Gardens/TextIDs"] = nil;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	----------------------------THF-------------------------------------
	if (trade:hasItemQty(3115,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11069, 1); 
		player:messageSpecial(ITEM_OBTAINED,11069);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3135,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11089, 1);
		player:messageSpecial(ITEM_OBTAINED,11089);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3155,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11109, 1);
		player:messageSpecial(ITEM_OBTAINED,11109);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3175,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11149, 1);
		player:messageSpecial(ITEM_OBTAINED,11149);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3195,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11129, 1);
		player:messageSpecial(ITEM_OBTAINED,11129);
	    player:tradeComplete();
    end
----------------------------WAR-------------------------------------
    if (trade:hasItemQty(3110,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11064, 1);
		player:messageSpecial(ITEM_OBTAINED,11064);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3130,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11084, 1);
		player:messageSpecial(ITEM_OBTAINED,11084);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3150,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11104, 1);
		player:messageSpecial(ITEM_OBTAINED,11104);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3170,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11124, 1);
		player:messageSpecial(ITEM_OBTAINED,11124);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3190,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11144, 1);
		player:messageSpecial(ITEM_OBTAINED,11144);
	    player:tradeComplete();
    end
----------------------------MNK-------------------------------------
    if (trade:hasItemQty(3111,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11065, 1);
		player:messageSpecial(ITEM_OBTAINED,11065);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3131,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11085, 1);
		player:messageSpecial(ITEM_OBTAINED,11085);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3151,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11105, 1);
		player:messageSpecial(ITEM_OBTAINED,11105);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3171,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11125, 1);
		player:messageSpecial(ITEM_OBTAINED,11125);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3191,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11145, 1);
		player:messageSpecial(ITEM_OBTAINED,11145);
	    player:tradeComplete();
    end
----------------------------WHM-------------------------------------
    if (trade:hasItemQty(3112,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11066, 1);
		player:messageSpecial(ITEM_OBTAINED,11066);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3132,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11086, 1);
		player:messageSpecial(ITEM_OBTAINED,11086);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3152,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11106, 1);
		player:messageSpecial(ITEM_OBTAINED,11106);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3172,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11126, 1);
		player:messageSpecial(ITEM_OBTAINED,11126);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3192,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11146, 1);
		player:messageSpecial(ITEM_OBTAINED,11146);
	    player:tradeComplete();
    end
----------------------------RDM-------------------------------------
    if (trade:hasItemQty(3114,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11068, 1);
		player:messageSpecial(ITEM_OBTAINED,11068);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3134,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11088, 1);
		player:messageSpecial(ITEM_OBTAINED,11088);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3154,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11108, 1);
		player:messageSpecial(ITEM_OBTAINED,11108);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3174,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11128, 1);
		player:messageSpecial(ITEM_OBTAINED,11128);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3194,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11148, 1);
		player:messageSpecial(ITEM_OBTAINED,11148);
	    player:tradeComplete();
    end
----------------------------BLM-------------------------------------
    if (trade:hasItemQty(3113,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11067, 1);
		player:messageSpecial(ITEM_OBTAINED,11067);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3133,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11087, 1);
		player:messageSpecial(ITEM_OBTAINED,11087);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3153,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11107, 1);
		player:messageSpecial(ITEM_OBTAINED,11107);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3173,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11127, 1);
		player:messageSpecial(ITEM_OBTAINED,11127);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3193,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11147, 1);
		player:messageSpecial(ITEM_OBTAINED,11147);
	    player:tradeComplete();
    end
----------------------------PLD-------------------------------------
    if (trade:hasItemQty(3116,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11070, 1);
		player:messageSpecial(ITEM_OBTAINED,11070);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3136,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11090, 1);
		player:messageSpecial(ITEM_OBTAINED,11090);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3156,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11110, 1);
		player:messageSpecial(ITEM_OBTAINED,11110);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3176,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11130, 1);
		player:messageSpecial(ITEM_OBTAINED,11130);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3196,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11150, 1);
		player:messageSpecial(ITEM_OBTAINED,11150);
	    player:tradeComplete();
    end
----------------------------DRK-------------------------------------
    if (trade:hasItemQty(3117,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11071, 1);
		player:messageSpecial(ITEM_OBTAINED,11071);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3137,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11091, 1);
		player:messageSpecial(ITEM_OBTAINED,11091);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3157,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11111, 1);
		player:messageSpecial(ITEM_OBTAINED,11111);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3177,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11131, 1);
		player:messageSpecial(ITEM_OBTAINED,11131);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3197,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11151, 1);
		player:messageSpecial(ITEM_OBTAINED,11151);
	    player:tradeComplete();
    end
----------------------------BST-------------------------------------
    if (trade:hasItemQty(3118,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11072, 1);
		player:messageSpecial(ITEM_OBTAINED,11072);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3138,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11092, 1);
		player:messageSpecial(ITEM_OBTAINED,11092);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3158,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11112, 1);
		player:messageSpecial(ITEM_OBTAINED,11112);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3178,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11132, 1);
		player:messageSpecial(ITEM_OBTAINED,11132);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3198,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11152, 1);
		player:messageSpecial(ITEM_OBTAINED,11152);
	    player:tradeComplete();
    end
----------------------------BRD-------------------------------------
    if (trade:hasItemQty(3119,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11073, 1);
		player:messageSpecial(ITEM_OBTAINED,11073);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3139,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11093, 1);
		player:messageSpecial(ITEM_OBTAINED,11093);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3159,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11113, 1);
		player:messageSpecial(ITEM_OBTAINED,11113);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3179,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11133, 1);
		player:messageSpecial(ITEM_OBTAINED,11133);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3199,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11153, 1);
		player:messageSpecial(ITEM_OBTAINED,11153);
	    player:tradeComplete();
    end
----------------------------RNG-------------------------------------
    if (trade:hasItemQty(3120,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11074, 1);
		player:messageSpecial(ITEM_OBTAINED,11074);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3140,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11094, 1);
		player:messageSpecial(ITEM_OBTAINED,11094);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3160,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11114, 1);
		player:messageSpecial(ITEM_OBTAINED,11114);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3180,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11134, 1);
		player:messageSpecial(ITEM_OBTAINED,11134);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3200,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11154, 1);
		player:messageSpecial(ITEM_OBTAINED,11154);
	    player:tradeComplete();
    end
----------------------------SAM-------------------------------------
    if (trade:hasItemQty(3121,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11075, 1);
		player:messageSpecial(ITEM_OBTAINED,11075);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3141,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11095, 1);
		player:messageSpecial(ITEM_OBTAINED,11095);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3161,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11115, 1);
		player:messageSpecial(ITEM_OBTAINED,11115);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3181,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11135, 1);
		player:messageSpecial(ITEM_OBTAINED,11135);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3201,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11155, 1);
		player:messageSpecial(ITEM_OBTAINED,11155);
	    player:tradeComplete();
    end
----------------------------NIN-------------------------------------
    if (trade:hasItemQty(3122,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11076, 1);
		player:messageSpecial(ITEM_OBTAINED,11076);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3142,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11096, 1);
		player:messageSpecial(ITEM_OBTAINED,11096);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3162,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11116, 1);
		player:messageSpecial(ITEM_OBTAINED,11116);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3182,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11136, 1);
		player:messageSpecial(ITEM_OBTAINED,11136);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3202,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11156, 1);
		player:messageSpecial(ITEM_OBTAINED,11156);
	    player:tradeComplete();
    end
----------------------------DRG-------------------------------------
    if (trade:hasItemQty(3123,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11077, 1);
		player:messageSpecial(ITEM_OBTAINED,11077);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3143,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11097, 1);
		player:messageSpecial(ITEM_OBTAINED,11097);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3163,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11117, 1);
		player:messageSpecial(ITEM_OBTAINED,11117);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3183,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11137, 1);
		player:messageSpecial(ITEM_OBTAINED,11137);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3203,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11157, 1);
		player:messageSpecial(ITEM_OBTAINED,11157);
	    player:tradeComplete();
    end
----------------------------SMN-------------------------------------
    if (trade:hasItemQty(3124,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11078, 1);
		player:messageSpecial(ITEM_OBTAINED,11078);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3144,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11098, 1);
		player:messageSpecial(ITEM_OBTAINED,11098);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3164,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11118, 1);
		player:messageSpecial(ITEM_OBTAINED,11118);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3184,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11138, 1);
		player:messageSpecial(ITEM_OBTAINED,11138);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3204,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11158, 1);
		player:messageSpecial(ITEM_OBTAINED,11158);
	    player:tradeComplete();
    end
----------------------------BLU-------------------------------------
    if (trade:hasItemQty(3125,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11079, 1);
		player:messageSpecial(ITEM_OBTAINED,11079);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3145,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11099, 1);
		player:messageSpecial(ITEM_OBTAINED,11099);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3165,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11119, 1);
		player:messageSpecial(ITEM_OBTAINED,11119);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3185,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11139, 1);
		player:messageSpecial(ITEM_OBTAINED,11139);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3205,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11159, 1);
		player:messageSpecial(ITEM_OBTAINED,11159);
	    player:tradeComplete();
    end
----------------------------COR-------------------------------------
    if (trade:hasItemQty(3126,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11080, 1);
		player:messageSpecial(ITEM_OBTAINED,11080);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3146,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11100, 1);
		player:messageSpecial(ITEM_OBTAINED,11100);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3166,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11120, 1);
		player:messageSpecial(ITEM_OBTAINED,11120);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3186,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11140, 1);
		player:messageSpecial(ITEM_OBTAINED,11140);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3206,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11160, 1);
		player:messageSpecial(ITEM_OBTAINED,11160);
	    player:tradeComplete();
    end
----------------------------PUP-------------------------------------
    if (trade:hasItemQty(3127,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11081, 1);
		player:messageSpecial(ITEM_OBTAINED,11081);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3147,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11101, 1);
		player:messageSpecial(ITEM_OBTAINED,11101);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3167,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11121, 1);
		player:messageSpecial(ITEM_OBTAINED,11121);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3187,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11141, 1);
		player:messageSpecial(ITEM_OBTAINED,11141);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3207,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11161, 1);
		player:messageSpecial(ITEM_OBTAINED,11161);
	    player:tradeComplete();
    end
----------------------------DNC-------------------------------------
    if (trade:hasItemQty(3128,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11082, 1);
		player:messageSpecial(ITEM_OBTAINED,11082);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3148,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11102, 1);
		player:messageSpecial(ITEM_OBTAINED,11102);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3168,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11122, 1);
		player:messageSpecial(ITEM_OBTAINED,11122);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3188,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11142, 1);
		player:messageSpecial(ITEM_OBTAINED,11142);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3208,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11162, 1);
		player:messageSpecial(ITEM_OBTAINED,11162);
	    player:tradeComplete();
    end
----------------------------SCH-------------------------------------
    if (trade:hasItemQty(3129,1) and trade:getItemCount() == 1) then 					--head
		player:addItem(11083, 1);
		player:messageSpecial(ITEM_OBTAINED,11083);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3149,1) and trade:getItemCount() == 1) then 					--body
		player:addItem(11103, 1);
		player:messageSpecial(ITEM_OBTAINED,11103);
	    player:tradeComplete();
	end
	if (trade:hasItemQty(3169,1) and trade:getItemCount() == 1) then 					--hands
		player:addItem(11123, 1);
		player:messageSpecial(ITEM_OBTAINED,11123);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3189,1) and trade:getItemCount() == 1) then 					--legs
		player:addItem(11143, 1);
		player:messageSpecial(ITEM_OBTAINED,11143);
	    player:tradeComplete();
    end
	if (trade:hasItemQty(3209,1) and trade:getItemCount() == 1) then 					--feet
		player:addItem(11163, 1);
		player:messageSpecial(ITEM_OBTAINED,11163);
	    player:tradeComplete();
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
end;	