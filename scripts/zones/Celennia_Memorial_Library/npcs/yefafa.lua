-----------------------------------
-- Area: Celennia_Memorial_Library
-- NPC:  Yefafa
-- Type: Standard NPC
-----------------------------------
package.loaded["scripts/zones/Celennia_Memorial_Library/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Celennia_Memorial_Library/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

count = trade:getItemCount();


itemQuality = 0;

if(trade:hasItemQty(12028,1) == true and trade:hasItemQty(3130,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11184); -- Rvg Lorica +1 

elseif(trade:hasItemQty(11184,1) == true and trade:hasItemQty(3214,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11084); -- Rvg. Lorica +2

elseif(trade:hasItemQty(12048,1) == true and trade:hasItemQty(3150,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11204); -- Rvg. mufflers +1

elseif(trade:hasItemQty(11204,1) == true and trade:hasItemQty(3218,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11104); -- Rvg. mufflers +2

elseif(trade:hasItemQty(12088,1) == true and trade:hasItemQty(3190,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11244); -- Rvg. Calligae +1

elseif(trade:hasItemQty(11244,1) == true and trade:hasItemQty(3226,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11144); -- Rvg. Calligae +2	

elseif(trade:hasItemQty(12068,1) == true and trade:hasItemQty(3170,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11224); -- Rvg. Cuisses +1

elseif(trade:hasItemQty(11224,1) == true and trade:hasItemQty(3222,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11124); -- Rvg. Cuisses +2	

elseif(trade:hasItemQty(12008,1) == true and trade:hasItemQty(3110,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11164); -- Rvg. Mask +1

elseif(trade:hasItemQty(11164,1) == true and trade:hasItemQty(3210,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11064); -- Rvg. Mask +2	

elseif(trade:hasItemQty(12029,1) == true and trade:hasItemQty(3131,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11185); -- Tantra Cyclas +1

elseif(trade:hasItemQty(11185,1) == true and trade:hasItemQty(3217,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11085); -- Tantra Cyclas +2

elseif(trade:hasItemQty(12049,1) == true and trade:hasItemQty(3151,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11205); -- Tantra Gloves +1

elseif(trade:hasItemQty(11205,1) == true and trade:hasItemQty(3220,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11105); -- Tantra Gloves +2

elseif(trade:hasItemQty(12089,1) == true and trade:hasItemQty(3191,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11245); -- Tantra Gaiters +1

elseif(trade:hasItemQty(11245,1) == true and trade:hasItemQty(3227,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11145); -- Tantra Gaiters +2

elseif(trade:hasItemQty(12069,1) == true and trade:hasItemQty(3171,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11225); -- Tantra Hose +1

elseif(trade:hasItemQty(11225,1) == true and trade:hasItemQty(3224,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11125); -- Tantra Hose +2	


elseif(trade:hasItemQty(12009,1) == true and trade:hasItemQty(3111,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11165); -- Tantra Crown +1

elseif(trade:hasItemQty(11165,1) == true and trade:hasItemQty(3212,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11065); -- Tantra Crown +2

elseif(trade:hasItemQty(12030,1) == true and trade:hasItemQty(3132,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11186); -- Orison Bliaud +1

elseif(trade:hasItemQty(11186,1) == true and trade:hasItemQty(3217,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11086); -- Orison Bliaud +2

elseif(trade:hasItemQty(12050,1) == true and trade:hasItemQty(3152,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11206); -- Orison Mitts +1

elseif(trade:hasItemQty(11206,1) == true and trade:hasItemQty(3219,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11106); -- Orison Mitts +2

elseif(trade:hasItemQty(12090,1) == true and trade:hasItemQty(3192,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11246); -- Orison Duckbills +1

elseif(trade:hasItemQty(11246,1) == true and trade:hasItemQty(3228,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11146); -- Orison Duckbills +2

elseif(trade:hasItemQty(12070,1) == true and trade:hasItemQty(3172,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11226); -- Orison Pantaloons +1

elseif(trade:hasItemQty(11226,1) == true and trade:hasItemQty(3225,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11126); -- Orison Pantaloons +2	

elseif(trade:hasItemQty(12010,1) == true and trade:hasItemQty(3112,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11166); -- Orison Cap +1

elseif(trade:hasItemQty(11166,1) == true and trade:hasItemQty(3210,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11066); -- Orion Cap +2

elseif(trade:hasItemQty(12031,1) == true and trade:hasItemQty(3133,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11187); -- Goetia Coat +1

elseif(trade:hasItemQty(11187,1) == true and trade:hasItemQty(3216,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11087); -- Goetia Coat +2

elseif(trade:hasItemQty(12051,1) == true and trade:hasItemQty(3153,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11207); -- Goetia Gloves +1

elseif(trade:hasItemQty(11207,1) == true and trade:hasItemQty(3220,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11107); -- Goetia Gloves +2

elseif(trade:hasItemQty(12091,1) == true and trade:hasItemQty(3193,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11247); -- Goetia Sabots +1

elseif(trade:hasItemQty(11247,1) == true and trade:hasItemQty(3229,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11147); -- Goetia Sabots +2

elseif(trade:hasItemQty(12071,1) == true and trade:hasItemQty(3173,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11227); -- Goetia Chausses +1

elseif(trade:hasItemQty(11227,1) == true and trade:hasItemQty(3222,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11127); -- Goetia Chausses +2	

elseif(trade:hasItemQty(12011,1) == true and trade:hasItemQty(3113,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11167); -- Goetia Petasos +1

elseif(trade:hasItemQty(11167,1) == true and trade:hasItemQty(3211,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11067); -- Goetia Petasos +2 

elseif(trade:hasItemQty(12012,1) == true and trade:hasItemQty(3114,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11187); -- Estq. Chapel +1

elseif(trade:hasItemQty(11168,1) == true and trade:hasItemQty(3212,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11087); -- Estq. Chapel +2

elseif(trade:hasItemQty(12032,1) == true and trade:hasItemQty(3134,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11207); -- Estoqueur's Sayon +1

elseif(trade:hasItemQty(11188,1) == true and trade:hasItemQty(3216,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11107); -- Estq. Sayon +2

elseif(trade:hasItemQty(12052,1) == true and trade:hasItemQty(3154,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11247); -- estq. Gantherots +1

elseif(trade:hasItemQty(11208,1) == true and trade:hasItemQty(3218,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11147); -- estq. Gantherots +2

elseif(trade:hasItemQty(12072,1) == true and trade:hasItemQty(3174,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11227); -- Estq. fuseau +1

elseif(trade:hasItemQty(11228,1) == true and trade:hasItemQty(3226,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11127); -- Estq. fuseau +2

elseif(trade:hasItemQty(12092,1) == true and trade:hasItemQty(3194,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11167); -- Estq. Houseaux +1

elseif(trade:hasItemQty(11248,1) == true and trade:hasItemQty(3223,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11067); -- Estq. Houseaux +2

elseif(trade:hasItemQty(12013,1) == true and trade:hasItemQty(3115,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11169); -- Raider's bonnet +1

elseif(trade:hasItemQty(11169,1) == true and trade:hasItemQty(3210,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11069); -- Raider's bonnet +2

elseif(trade:hasItemQty(12033,1) == true and trade:hasItemQty(3135,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11189); -- Raider's Vest +1

elseif(trade:hasItemQty(11189,1) == true and trade:hasItemQty(3215,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11089); -- Raider's Vest +2

elseif(trade:hasItemQty(12053,1) == true and trade:hasItemQty(3155,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11209); -- Raider's Armlets +1

elseif(trade:hasItemQty(11209,1) == true and trade:hasItemQty(3218,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11109); -- Raider's Armlets +2

elseif(trade:hasItemQty(12073,1) == true and trade:hasItemQty(3175,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11229); -- Raider's Culottes +1

elseif(trade:hasItemQty(11229,1) == true and trade:hasItemQty(3223,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11129); -- Raider's Culottes +2

elseif(trade:hasItemQty(12093,1) == true and trade:hasItemQty(3195,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11249); -- Raider's Poulaines +1

elseif(trade:hasItemQty(11249,1) == true and trade:hasItemQty(3228,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11149); -- Raider's Poulaines +2

elseif(trade:hasItemQty(12014,1) == true and trade:hasItemQty(3116,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11170); -- Creed Armet +1

elseif(trade:hasItemQty(11170,1) == true and trade:hasItemQty(3213,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11070); -- Creed Armet +2

elseif(trade:hasItemQty(12054) == true and trade:hasItemQty(3136,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11190) -- Creed Curaiss +1

elseif(trade:hasItemQty(11190,1) == true and trade:hasItemQty(3214,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11090); -- Creed Curaiss +2

elseif(trade:hasItemQty(12054,1) == true and trade:hasItemQty(3156,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11210); -- Creed Gauntlets +1

elseif(trade:hasItemQty(11210,1) == true and trade:hasItemQty(3221,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11110); -- Creed Gauntlets +2

elseif(trade:hasItemQty(120774,1) == true and trade:hasItemQty(3176,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11230); -- Creed Cuisses +1

elseif(trade:hasItemQty(11230,1) == true and trade:hasItemQty(3223,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11130); -- Creed Cuisses +2

elseif(trade:hasItemQty(12094,1) == true and trade:hasItemQty(3196,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11250); -- Creed Sabatons +1

elseif(trade:hasItemQty(11250,1) == true and trade:hasItemQty(3226,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11150); -- Creed Sabatons +2

elseif(trade:hasItemQty(12015,1) == true and trade:hasItemQty(3117,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11171); -- Bale Burgeonet +1

elseif(trade:hasItemQty(11171,1) == true and trade:hasItemQty(3211,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11071); -- Bale Burgeonet +2

elseif(trade:hasItemQty(12055) == true and trade:hasItemQty(3137,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11191) -- Bale Curaiss +1

elseif(trade:hasItemQty(11191,1) == true and trade:hasItemQty(3215,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11091); -- Bale Curaiss +2

elseif(trade:hasItemQty(12055,1) == true and trade:hasItemQty(3157,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11211); -- Bale Gauntlets +1

elseif(trade:hasItemQty(11211,1) == true and trade:hasItemQty(3219,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11111); -- Bale Gauntlets +2

elseif(trade:hasItemQty(12075,1) == true and trade:hasItemQty(3177,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11231); -- Bale Flanchard +1

elseif(trade:hasItemQty(11231,1) == true and trade:hasItemQty(3223,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11131); -- Bale Flanchard +2

elseif(trade:hasItemQty(12095,1) == true and trade:hasItemQty(3197,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11251); -- Bale Sollerets +1

elseif(trade:hasItemQty(11251,1) == true and trade:hasItemQty(3227,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11151); -- Bale Sollerets +2	

elseif(trade:hasItemQty(12016,1) == true and trade:hasItemQty(3117,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11172); -- Ferin Cabasset +1

elseif(trade:hasItemQty(11172,1) == true and trade:hasItemQty(3211,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11072); -- Ferin Cabasset +2

elseif(trade:hasItemQty(12056) == true and trade:hasItemQty(3118,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11192) -- Ferin Gausape +1

elseif(trade:hasItemQty(11192,1) == true and trade:hasItemQty(3217,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11092); -- Ferin Gausape +2

elseif(trade:hasItemQty(12056,1) == true and trade:hasItemQty(3158,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11212); -- Ferin Manoplas +1

elseif(trade:hasItemQty(11212,1) == true and trade:hasItemQty(3218,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11112); -- Ferin Manoplas +2

elseif(trade:hasItemQty(12076,1) == true and trade:hasItemQty(3178,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11232); -- Ferin Quijotes +1

elseif(trade:hasItemQty(11232,1) == true and trade:hasItemQty(3224,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11132); -- Ferin Quijotes +2

elseif(trade:hasItemQty(12096,1) == true and trade:hasItemQty(3198,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11252); -- Ferin Ocreae +1

elseif(trade:hasItemQty(11252,1) == true and trade:hasItemQty(3229,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11152); -- Ferin Ocreae +2

elseif(trade:hasItemQty(12017,1) == true and trade:hasItemQty(3118,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11173); -- Aoidos' Calot +1

elseif(trade:hasItemQty(11173,1) == true and trade:hasItemQty(3210,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11073); -- Aoidos' Calot +2

elseif(trade:hasItemQty(12057) == true and trade:hasItemQty(3119,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11193) -- Aoidos' Hongreline +1

elseif(trade:hasItemQty(11193,1) == true and trade:hasItemQty(3214,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11093); -- Aoidos' Hongreline +2

elseif(trade:hasItemQty(12057,1) == true and trade:hasItemQty(3159,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11213); -- Aoidos' Mnchtte +1

elseif(trade:hasItemQty(11213,1) == true and trade:hasItemQty(3220,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11113); -- Aoidos' Mnchtte +2

elseif(trade:hasItemQty(12077,1) == true and trade:hasItemQty(3179,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11233); -- Aoidos' Rhingrave +1

elseif(trade:hasItemQty(11233,1) == true and trade:hasItemQty(3223,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11133); -- Aoidos' Rhingrave +2

elseif(trade:hasItemQty(12097,1) == true and trade:hasItemQty(3199,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11253); -- Aoidos' Cothurnes +1

elseif(trade:hasItemQty(11253,1) == true and trade:hasItemQty(3228,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11153); -- Aoidos' Cothurnes +2

elseif(trade:hasItemQty(12018,1) == true and trade:hasItemQty(3120,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11174); -- Sylvan Gapette +1

elseif(trade:hasItemQty(11174,1) == true and trade:hasItemQty(3210,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11074); -- Sylvan Gapette +2

elseif(trade:hasItemQty(12058) == true and trade:hasItemQty(3140,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11194) -- Sylvan Caban +1

elseif(trade:hasItemQty(11194,1) == true and trade:hasItemQty(3215,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11094); -- Sylvan Caban +2

elseif(trade:hasItemQty(12058,1) == true and trade:hasItemQty(3160,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11214); -- Sylvan Glovelettes +1

elseif(trade:hasItemQty(11214,1) == true and trade:hasItemQty(3219,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11114); -- Sylvan Glovelettes +2

elseif(trade:hasItemQty(12078,1) == true and trade:hasItemQty(3180,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11234); -- Sylvan Bragues +1

elseif(trade:hasItemQty(11234,1) == true and trade:hasItemQty(3224,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11134); -- Sylvan Bragues +2

elseif(trade:hasItemQty(12098,1) == true and trade:hasItemQty(3200,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11254); -- Sylvan Bottillons +1

elseif(trade:hasItemQty(11254,1) == true and trade:hasItemQty(3229,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11154); -- Sylvan Bottillons +2 

elseif(trade:hasItemQty(12019,1) == true and trade:hasItemQty(3121,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11176); -- Unkai Kabuto +1

elseif(trade:hasItemQty(11176,1) == true and trade:hasItemQty(3212,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11075); -- Unkai Kabuto +2

elseif(trade:hasItemQty(12059) == true and trade:hasItemQty(3141,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11195) -- Unkai Domaru +1

elseif(trade:hasItemQty(11195,1) == true and trade:hasItemQty(3216,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11095); -- Unkai Domaru +2

elseif(trade:hasItemQty(12059,1) == true and trade:hasItemQty(3161,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11215); -- Unkai Kote +1

elseif(trade:hasItemQty(11215,1) == true and trade:hasItemQty(3220,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11115); -- Unkai Kote +2

elseif(trade:hasItemQty(12079,1) == true and trade:hasItemQty(3181,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11235); -- Unkai Haidate +1

elseif(trade:hasItemQty(11235,1) == true and trade:hasItemQty(3224,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11135); -- Unkai Haidate +2

elseif(trade:hasItemQty(12099,1) == true and trade:hasItemQty(3201,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11255); -- Unkai Sune-ate +1

elseif(trade:hasItemQty(11255,1) == true and trade:hasItemQty(3228,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11155); -- Unkai Sune-ate +2

elseif(trade:hasItemQty(12020,1) == true and trade:hasItemQty(3122,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11177); -- Iga Zukin +1

elseif(trade:hasItemQty(11177,1) == true and trade:hasItemQty(3211,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11076); -- Iga Zukin +2

elseif(trade:hasItemQty(12060) == true and trade:hasItemQty(3142,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11196) -- Iga Ningi +1

elseif(trade:hasItemQty(11196,1) == true and trade:hasItemQty(3214,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11096); -- Iga Ningi +2

elseif(trade:hasItemQty(12060,1) == true and trade:hasItemQty(3162,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11216); -- Iga Tekko +1

elseif(trade:hasItemQty(11216,1) == true and trade:hasItemQty(3221,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11116); -- iga Tekko +2

elseif(trade:hasItemQty(12080,1) == true and trade:hasItemQty(3182,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11236); -- Iga Hakama +1

elseif(trade:hasItemQty(11236,1) == true and trade:hasItemQty(3222,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11136); -- Iga Hakama +2

elseif(trade:hasItemQty(12100,1) == true and trade:hasItemQty(3202,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11256); -- Iga Kyahan +1

elseif(trade:hasItemQty(11256,1) == true and trade:hasItemQty(3229,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11156); -- Iga Kyahan +2

elseif(trade:hasItemQty(12021,1) == true and trade:hasItemQty(3123,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11178); -- Lancer's Mezail +1

elseif(trade:hasItemQty(11178,1) == true and trade:hasItemQty(3213,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11077); -- Lancer's Mezail +2

elseif(trade:hasItemQty(12061) == true and trade:hasItemQty(3143,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11197) -- Lncr. Plackart +1

elseif(trade:hasItemQty(11197,1) == true and trade:hasItemQty(3217,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11097); -- Lncr. Plackart +2

elseif(trade:hasItemQty(12061,1) == true and trade:hasItemQty(3163,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11217); -- Lancer's Vambraces +1

elseif(trade:hasItemQty(11217,1) == true and trade:hasItemQty(3221,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11117); -- Lancer's Vambraces +2

elseif(trade:hasItemQty(12081,1) == true and trade:hasItemQty(3183,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11237); -- Lancer's Cuissots +1

elseif(trade:hasItemQty(11237,1) == true and trade:hasItemQty(3225,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11137); -- Lancer's Cuissots +2

elseif(trade:hasItemQty(12101,1) == true and trade:hasItemQty(3203,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11257); -- Lncr. Schynbalds +1

elseif(trade:hasItemQty(11257,1) == true and trade:hasItemQty(3229,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11157); -- Lncr. Schynbalds +2

elseif(trade:hasItemQty(12022,1) == true and trade:hasItemQty(3124,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11178); -- Caller's horn +1

elseif(trade:hasItemQty(11178,1) == true and trade:hasItemQty(3211,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11078); -- Caller's horn +2

elseif(trade:hasItemQty(12042) == true and trade:hasItemQty(3144,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11198) -- Caller's Doublet +1

elseif(trade:hasItemQty(11198,1) == true and trade:hasItemQty(3215,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11098); -- Caller's Doublet +2

elseif(trade:hasItemQty(12062,1) == true and trade:hasItemQty(3164,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11218); -- Caller's Bracers +1

elseif(trade:hasItemQty(11218,1) == true and trade:hasItemQty(3220,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11118); -- Caller's Bracers +2

elseif(trade:hasItemQty(12082,1) == true and trade:hasItemQty(3184,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11238); -- Caller's Spats +1

elseif(trade:hasItemQty(11238,1) == true and trade:hasItemQty(3225,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11138); -- Caller's Spats +2

elseif(trade:hasItemQty(12102,1) == true and trade:hasItemQty(3204,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11258); -- Caller's Pigaches +1

elseif(trade:hasItemQty(11258,1) == true and trade:hasItemQty(3226,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11158); -- Caller's Pigaches +2

elseif(trade:hasItemQty(12023,1) == true and trade:hasItemQty(3125,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11179); -- Mavi Kavuk +1

elseif(trade:hasItemQty(11179,1) == true and trade:hasItemQty(3211,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11079); -- Mavi Kavuk +2

elseif(trade:hasItemQty(12063) == true and trade:hasItemQty(3145,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11199) -- Mavi Mintan +1

elseif(trade:hasItemQty(11199,1) == true and trade:hasItemQty(3215,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11099); -- Mavi Mintan +2

elseif(trade:hasItemQty(12063,1) == true and trade:hasItemQty(3165,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11219); -- Mavi Bazubands +1

elseif(trade:hasItemQty(11219,1) == true and trade:hasItemQty(3220,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11119); -- Mavi Bazubands +2

elseif(trade:hasItemQty(12083,1) == true and trade:hasItemQty(3185,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11239); -- Mavi Tayt +1

elseif(trade:hasItemQty(11239,1) == true and trade:hasItemQty(3225,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11139); -- Mavi Tayt +2

elseif(trade:hasItemQty(12103,1) == true and trade:hasItemQty(3205,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11259); -- Mavi Basmuk +1

elseif(trade:hasItemQty(11259,1) == true and trade:hasItemQty(3226,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11159); -- Mavi Basmuk +2

elseif(trade:hasItemQty(12024,1) == true and trade:hasItemQty(3126,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11180); -- Navarch's Tricorne +1

elseif(trade:hasItemQty(11180,1) == true and trade:hasItemQty(3212,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11080); -- Navarch's Tricorne +2

elseif(trade:hasItemQty(12064) == true and trade:hasItemQty(3146,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11200) -- Navarch's Frac +1

elseif(trade:hasItemQty(11200,1) == true and trade:hasItemQty(3215,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11100); -- Navarch's Frac +2

elseif(trade:hasItemQty(12064,1) == true and trade:hasItemQty(3166,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11220); -- Navarch's Gants +1

elseif(trade:hasItemQty(11220,1) == true and trade:hasItemQty(3221,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11120); -- Navarch's Gants +2

elseif(trade:hasItemQty(12084,1) == true and trade:hasItemQty(3186,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11240); -- Navarch's Culottes +1

elseif(trade:hasItemQty(11240,1) == true and trade:hasItemQty(3225,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11140); -- Navarch's Culottes +2

elseif(trade:hasItemQty(12104,1) == true and trade:hasItemQty(3206,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11260); -- Navarch's Bottes +1

elseif(trade:hasItemQty(11260,1) == true and trade:hasItemQty(3227,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11160); -- Navarch's Bottes +2

elseif(trade:hasItemQty(12025,1) == true and trade:hasItemQty(3127,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11181); -- Cirque Cappello +1

elseif(trade:hasItemQty(11181,1) == true and trade:hasItemQty(3212,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11081); -- Cirque Cappello +2

elseif(trade:hasItemQty(12065) == true and trade:hasItemQty(3147,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11201) -- Cirque Farsetto +1

elseif(trade:hasItemQty(11201,1) == true and trade:hasItemQty(3216,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11101); -- Cirque Farsetto +2

elseif(trade:hasItemQty(12065,1) == true and trade:hasItemQty(3167,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11221); -- Cirque Guanti +1

elseif(trade:hasItemQty(11221,1) == true and trade:hasItemQty(3221,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11121); -- Cirque Guanti +2

elseif(trade:hasItemQty(12085,1) == true and trade:hasItemQty(3187,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11241); -- Cirque Pantaloni +1

elseif(trade:hasItemQty(11241,1) == true and trade:hasItemQty(3222,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11141); -- Cirque Pantaloni +2

elseif(trade:hasItemQty(12105,1) == true and trade:hasItemQty(3207,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11261); -- Cirque Scarpe +1

elseif(trade:hasItemQty(11261,1) == true and trade:hasItemQty(3228,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11161); -- Cirque Scarpe +2

elseif(trade:hasItemQty(12026,1) == true and trade:hasItemQty(3128,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11182); -- Charis Tiara+1

elseif(trade:hasItemQty(11182,1) == true and trade:hasItemQty(3213,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11082); -- Charis Tiara +2

elseif(trade:hasItemQty(12046) == true and trade:hasItemQty(3148,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11202) -- Charis Casaque +1

elseif(trade:hasItemQty(11202,1) == true and trade:hasItemQty(3216,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11102); -- Charis Casaque +2

elseif(trade:hasItemQty(12066,1) == true and trade:hasItemQty(3168,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11222); -- CCharis Bangles +1

elseif(trade:hasItemQty(11222,1) == true and trade:hasItemQty(3219,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11122); -- Charis Bangles +2

elseif(trade:hasItemQty(12086,1) == true and trade:hasItemQty(3188,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11242); -- Charis Tights +1

elseif(trade:hasItemQty(11242,1) == true and trade:hasItemQty(3225,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11142); -- Charis Tights +2

elseif(trade:hasItemQty(12106,1) == true and trade:hasItemQty(3208,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11262); -- Charis Toeshoes +1

elseif(trade:hasItemQty(11262,1) == true and trade:hasItemQty(3226,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11162); -- Charis Toeshoes +2

elseif(trade:hasItemQty(12027,1) == true and trade:hasItemQty(3129,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11183); -- Savant's Bonnet +1

elseif(trade:hasItemQty(11183,1) == true and trade:hasItemQty(3213,10) == true and trade:getItemCount() == 11) then 
player:tradeComplete();
player:addItem(11083); -- Savant's Bonnet +2

elseif(trade:hasItemQty(12047) == true and trade:hasItemQty(3149,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11203) -- Savant's Gown +1

elseif(trade:hasItemQty(11203,1) == true and trade:hasItemQty(3217,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11103); -- Savant's Gown +2

elseif(trade:hasItemQty(12067,1) == true and trade:hasItemQty(3169,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11223); -- Savant's Bracers +1

elseif(trade:hasItemQty(11223,1) == true and trade:hasItemQty(3218,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11123); -- Savant's Bracers +2

elseif(trade:hasItemQty(12087,1) == true and trade:hasItemQty(3189,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11243); -- Savant's Pants +1

elseif(trade:hasItemQty(11243,1) == true and trade:hasItemQty(3224,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11143); -- Savant's Pants +2

elseif(trade:hasItemQty(12107,1) == true and trade:hasItemQty(3209,8) == true and trade:getItemCount() == 9) then 
player:tradeComplete();
player:addItem(11263); -- Savant's Loafers +1

elseif(trade:hasItemQty(11263,1) == true and trade:hasItemQty(3227,6) == true and trade:getItemCount() == 7) then 
player:tradeComplete();
player:addItem(11163); -- Savant's Loafers +2
end




end; 


-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x278D);
end; 


-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;


-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

if (csid == 0x278D and option == 1002) then
player:tradeComplete();
player:addItem(objecttrade);
player:messageSpecial(ITEM_OBTAINED,objecttrade);


end
end;	