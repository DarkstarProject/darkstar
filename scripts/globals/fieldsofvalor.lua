package.loaded["scripts/globals/conquestguards"] = nil;
require("/scripts/globals/settings");
require("scripts/globals/conquestguards");

PLAYER_ABOVE_MOBLEVEL_DIFF = 16;  -- Limit for Weaker Monsters than the Player Character
PLAYER_BELOW_MOBLEVEL_DIFF = 16;  -- Limit for Stronger Monsters than the Player Character

--require("/scripts/globals/spell_definitions");


-------------------------
-- 			Fields of Valor Database
--  Allows customisation of Fields of Valor Pages
--              Author: Kegsay
--------------------------

--[[
Regime ID   ª	Area   «	Listing   «
0 	None 	No regime.
1 	West Ronfaure 	Worms
2 	West Ronfaure 	Hares
3 	West Ronfaure 	Beetles/Funguars
4 	West Ronfaure 	Orcs/Beetles
5 	La Theine Plateau 	Saplings/Wasps
6 	La Theine Plateau 	Funguars
7 	Valkurm Dunes 	Lizards/Hares
8 	Valkurm Dunes 	Crabs/Lizards
9 	Valkurm Dunes 	Flies/Crabs
10 	Valkurm Dunes 	Sheep/Flies
11 	Jugner Forest 	Leeches
12 	Jugner Forest 	Beetles/Leeches
13 	Jugner Forest 	Funguars/Beetles
14 	Jugner Forest 	Funguars/Tigers
15 	Batallia Downs 	Flies/Bas
16 	North Gustaberg 	Worms
17 	North Gustaberg 	Hornets
18 	North Gustaberg 	Vultures/Saplings
19 	North Gustaberg 	Quadav/Lizards
20 	Konschtat Highlands 	Worms/Lizards
21 	Pashhow Marshlands 	Flies
22 	Pashhow Marshlands 	Leeches/Flies
23 	Pashhow Marshlands 	Crawlers/Leeches
24 	Pashhow Marshlands 	Funguars/Crawlers
25 	Rolanberry Fields 	Wasps/Crawlers
26 	West Sarutabaruta 	Mandragoras
27 	West Sarutabaruta 	Rarabs
28 	West Sarutabaruta 	Crawlers/Birds
29 	West Sarutabaruta 	Yagudo/Crawler
30 	Tahrongi Canyon 	Saplings/Bees
31 	Tahrongi Canyon 	Akababas
32 	Buburimu Peninsula 	Mandragoras/Rarabs
33 	Buburimu Peninsula 	Crawlers/Mandragoras
34 	Buburimu Peninsula 	Dhalmel/Crawlers
35 	Buburimu Peninsula 	Leeches/Dhalmel
36 	Meriphataud Mountains 	Flies
37 	Meriphataud Mountains 	Lizards/Flies
38 	Meriphataud Mountains 	Beetles/Lizards
39 	Meriphataud Mountains 	Raptors/Beetles
40 	Sauromugue Champaign 	Lizards/Beetles
41 	Qufim Island 	Clippers/Worms 
42 	Qufim Island 	Clippers/Seeker Bats
43 	Qufim Island 	Pugils/Clippers
44 	Qufim Island 	Gigas/Pugils
45 	Qufim Island 	Acrophies/Gigas/Pugils
46 	Beaucedine Glacier 	Tigers/Goblins
47 	Beaucedine Glacier 	Tigers/Statues
48 	Beaucedine Glacier 	Bat Eyes/Statues
49 	Beaucedine Glacier 	Goblin/Bat Eyes/Statues
50 	Beaucedine Glacier 	Gigas/Goblin/Bat Eye
51 	Xarcabard 	Skeleton/Etemmu
52 	Xarcabard 	Skeleton/Evil Weapon
53 	Xarcabard 	Evil Eyes/Skeleton/Evil Weapons
54 	Xarcabard 	Gigas/Evil Eyes/Skeletons
55 	Xarcabard 	Demon/Gigas/Evil Eye
56 	West Ronfaure 	Sheep/Goblin
57 	Valkurm Dunes 	Leeches/Goblin
58 	Jugner Forest 	Sapling/Screamer
59 	North Gustaberg 	Quadav/Sheep
60 	Pashhow Marshlands 	Quadav/Funguar/Goobbue
61 	West Sarutabaruta 	Yagudo/Bee
62 	Buburimu Peninsula 	Pugil/Goblin
63 	Meriphataud Mountains 	Coeurls/Evil Weapons
64 	East Ronfaure 	Pugils
65 	East Ronfaure 	Worms
66 	East Ronfaure 	Hares
67 	East Ronfaure 	Orcs/Funguar
68 	East Ronfaure 	Sheep/Beetles
69 	Latheine Plateau (note the typo) 	Sheep/Akbabas
70 	Latheine Plateau (note the typo) 	Sheep/Crab
71 	Latheine Plateau (note the typo) 	Bats/Funguar
72 	Battalia Downs 	Saplings/Flies
73 	Battalia Downs 	Saplings/Bas
74 	Battalia Downs 	Tigers/Goblins/Orcs
75 	Battalia Downs 	Tigers
76 	South Gustaberg 	Bees
77 	South Gustaberg 	Worms
78 	South Gustaberg 	Vultures/Saplings
79 	South Gustaberg 	Goblins
80 	South Gustaberg 	Lizards/Crabs
81 	Konschtat Highlands 	Saplings/Wasps
82 	Konschtat Highlands 	Wasps/Lizards
83 	Konschtat Highlands 	Quadav
84 	Konschtat Highlands 	Ambushers/Tinkerers/Butchers
85 	Rolanberry Fields 	Wasps/Leeches
86 	Rolanberry Fields 	Crawlers/Goblins
87 	Rolanberry Fields 	Crawlers/Quadav
88 	Rolanberry Fields 	Ochu
89 	East Sarutabaruta 	Mandragora
90 	East Sarutabaruta 	Bee
91 	East Sarutabaruta 	Rarabs
92 	East Sarutabaruta 	Crabs/Crawlers
93 	East Sarutabaruta 	Crows/Crawlers
94 	Tahrongi Canyon 	Rarabs/Pygmaioi
95 	Tahrongi Canyon 	Pygmaioi/Bees
96 	Tahrongi Canyon 	Crawlers/Dhalmel
97 	Sauromugue Champaign 	Raptors/Goblins
98 	Sauromugue Champaign 	Coeurls/Goblins
99 	Sauromugue Champaign 	Raptors/Yagudo
100 	Sauromugue Champaign 	Tabar Beaks/Evil Weapons
101 	Behemoth's Dominion 	Lesser Gaylas/Greater Gaylas
102 	Behemoth's Dominion 	Lesser Gayla/Evil Weapon
103 	Behemoth's Dominion 	Greater Gayla/Undead
104 	Cape Teriggan 	Bunnies/Lizards
105 	Cape Teriggan 	Crabs/Goblins
106 	Cape Teriggan 	Crabs/Raptors
107 	Cape Teriggan 	Crabs/Cockatrices
108 	Cape Teriggan 	Cockatrices/Manticores
109 	Eastern Altepa Desert 	Spiders
110 	Eastern Altepa Desert 	Auxiliarii/Fabers/Beetles
111 	Eastern Altepa Desert 	Funditors/Fabers/Dhalmel
112 	Eastern Altepa Desert 	Decurio/Sagittarii/Speculator/Manticore
113 	Eastern Altepa Desert 	Poachers/Robbers/Reapers/Manticore
114 	The Sanctuary of Zi'Tah 	Ogreflies/Goobbue
115 	The Sanctuary of Zi'Tah 	Myxomycetes/Ogreflies
116 	The Sanctuary of Zi'Tah 	Parasites/Myxomycetes
117 	The Sanctuary of Zi'Tah 	Coeurls/Parasites
118 	The Sanctuary of Zi'Tah 	Golems/Coeurls
119 	Ro'Maeve 	Killing/Ominous Weapons
120 	Ro'Maeve 	Flagons
121 	Ro'Maeve 	Cursed Puppets
122 	Ro'Maeve 	Apocalyptic Weapons/Golems
123 	Ro'Maeve 	Infernal Weapons/Golems
124 	Yuhtunga Jungle 	Mandragoras/Lizards
125 	Yuhtunga Jungle 	Bees/Goblins
126 	Yuhtunga Jungle 	Opo-opo
127 	Yuhtunga Jungle 	Sahagin/Makara
128 	Yuhtunga Jungle 	Opo-opo/Crawlers
129 	Yhoator Jungle 	Lizards/Goblins
130 	Yhoator Jungle 	Mandragora/Wasps
131 	Yhoator Jungle 	Opo-opo
132 	Yhoator Jungle 	Crawlers/Opo-opo
133 	Yhoator Jungle 	Tonberry
134 	Western Altepa Desert 	Spiders/Essedarii
135 	Western Altepa Desert 	Dhalmel/Equites/Retiarius
136 	Western Altepa Desert 	Beetles/Cactuar
137 	Western Altepa Desert 	Goblins/Scorpions
138 	Western Altepa Desert 	Secutors/Lanistae
139 	Valley of Sorrows 	Raptors/Perytons
140 	Valley of Sorrows 	Raptors/Manticores
141 	Valley of Sorrows 	Perytons/Manticores
142 	Ru'Aun Gardens 	Flamingo/Sprinkler
143 	Ru'Aun Gardens 	Sprinklers/Dolls
144 	Ru'Aun Gardens 	Dolls
145 	Ru'Aun Gardens 	Fire/Air/Thunder Elementals
146 	Ru'Aun Gardens 	Ice/Earth/Water Elementals
147+ 	Values higher than 147 are Hunt Registries.]]--

--key item IDs
ELITE_TRAINING_INTRODUCTION     = 1116;
ELITE_TRAINING_CHAPTER_1        = 1117;
ELITE_TRAINING_CHAPTER_2        = 1118;
ELITE_TRAINING_CHAPTER_3        = 1119;
ELITE_TRAINING_CHAPTER_4        = 1120;
ELITE_TRAINING_CHAPTER_5        = 1121;
ELITE_TRAINING_CHAPTER_6        = 1122;
ELITE_TRAINING_CHAPTER_7        = 1123;

--EVENT PARAM ID CONSTANTS (change these if even seqs displayed break!)
--onEventUpdate params
FOV_MENU_PAGE_1 = 18;
FOV_MENU_PAGE_2 = 34;
FOV_MENU_PAGE_3 = 50;
FOV_MENU_PAGE_4 = 66;
FOV_MENU_PAGE_5 = 82;
FOV_MENU_VIEW_REGIME = 1;
FOV_MENU_LEVEL_RANGE = 6;
--onEventFinish params
FOV_MENU_REGEN = 53;
FOV_MENU_REFRESH = 69;
FOV_MENU_PROTECT = 85;
FOV_MENU_SHELL = 101;
FOV_MENU_MEAT = 117;
FOV_MENU_FISH = 133;
FOV_MENU_COOKIE = 149;
FOV_MENU_NOODLES = 165;
FOV_MENU_RERAISE = 37;
FOV_MENU_HOME_NATION = 21;
FOV_MENU_CANCEL_REGIME = 3;
FOV_MENU_REPEAT_REGIME1 = -2147483630;
FOV_MENU_REPEAT_REGIME2 = -2147483614;
FOV_MENU_REPEAT_REGIME3 = -2147483598;
FOV_MENU_REPEAT_REGIME4 = -2147483582;
FOV_MENU_REPEAT_REGIME5 = -2147483566;
FOV_MENU_ELITE_INTRO = 36;
FOV_MENU_ELITE_CHAP1 = 52;
FOV_MENU_ELITE_CHAP2 = 68;
FOV_MENU_ELITE_CHAP3 = 84;
FOV_MENU_ELITE_CHAP4 = 100;
FOV_MENU_ELITE_CHAP5 = 116;
FOV_MENU_ELITE_CHAP6 = 132;
FOV_MENU_ELITE_CHAP7 = 148;

--Special Message IDs (these usually don't break)
FOV_MSG_KILLED_TARGET    = 558;
FOV_MSG_COMPLETED_REGIME = 559;
FOV_MSG_GET_TABS         = 566;


--MESSAGE ID CONSTANTS (msg id of "new training regime registered!": change this if msg ids break!)
FOV_MSG_EAST_RONFAURE = 9720;
FOV_MSG_WEST_RONFAURE = 10299;
FOV_MSG_NORTH_GUSTABERG = 10270;
FOV_MSG_SOUTH_GUSTABERG = 9748;
FOV_MSG_WEST_SARUTA =10079;
FOV_MSG_EAST_SARUTA =9793;
FOV_MSG_KONSCHTAT =9691;
FOV_MSG_TAHRONGI =9710;
FOV_MSG_LA_THEINE =10029;
FOV_MSG_PASHHOW =10599;
FOV_MSG_JUGNER =10745;
FOV_MSG_MERIPH =10478;
FOV_MSG_BATALLIA =9911;
FOV_MSG_SAUROMAGUE =9701;
FOV_MSG_ROLANBERRY =9662;
FOV_MSG_VALKURM = 10156;
FOV_MSG_BUBURIMU =10168;
FOV_MSG_QUFIM =10242;
FOV_MSG_RUAUN_GARDENS = 9662;

FOV_MSG_BEAUCEDINE =10639;
FOV_MSG_YUHTUNGA =9961;
FOV_MSG_YHOATOR =9910;
FOV_MSG_WEST_ALTEPA =9721;
FOV_MSG_EAST_ALTEPA =9858;
FOV_MSG_XARCABARD =10146;
FOV_MSG_BEHEMOTH =9352;
FOV_MSG_ZITAH =10178;
FOV_MSG_ROMAEVE =9527;
FOV_MSG_TERIGGAN =10021;
FOV_MSG_SORROWS =9507;

--Event IDs
FOV_EVENT_RUAUN_GARDENS = 0x0049;
FOV_EVENT_EAST_RONFAURE = 0x003d;
FOV_EVENT_WEST_RONFAURE = 0x003d;
FOV_EVENT_WEST_SARUTA = 0x0034;
FOV_EVENT_EAST_SARUTA = 0x003d;
FOV_EVENT_NORTH_GUSTABERG = 0x010a;
FOV_EVENT_SOUTH_GUSTABERG = 0x003d;
FOV_EVENT_LA_THEINE = 0x003d;
FOV_EVENT_KONSCHTAT =0x003d;
FOV_EVENT_TAHRONGI =0x003d;
FOV_EVENT_PASHHOW =0x001c;
FOV_EVENT_JUGNER =0x0020;
FOV_EVENT_MERIPH =0x002e;
FOV_EVENT_BATALLIA =0x003d;
FOV_EVENT_SAUROMAGUE =0x003d;
FOV_EVENT_ROLANBERRY =0x003d;
FOV_EVENT_VALKURM = 0x002f;
FOV_EVENT_BUBURIMU =0x0033;
FOV_EVENT_QUFIM =0x0021;
FOV_EVENT_YUHTUNGA =0x003d;
FOV_EVENT_YHOATOR =0x003d;
FOV_EVENT_WEST_ALTEPA =0x003d;
FOV_EVENT_EAST_ALTEPA =0x003d; --test
FOV_EVENT_BEAUCEDINE =0x00da;
FOV_EVENT_XARCABARD =0x0030;
FOV_EVENT_BEHEMOTH =0x003d;
FOV_EVENT_ZITAH =0x003d;
FOV_EVENT_ROMAEVE =0x003d;
FOV_EVENT_TERIGGAN =0x003d; --test
FOV_EVENT_SORROWS =0x003d;

----------------------------------
-- Start FoV onTrigger
----------------------------------

function startFov(eventid,player)
	local hasRegime = player:getVar("fov_regimeid");
	local tabs = player:getVar("tabs");
	player:startEvent(eventid,0,0,0,0,0,0,tabs,hasRegime);
end

----------------------------------
-- Update FoV onEventUpdate
----------------------------------

function updateFov(player,csid,menuchoice,r1,r2,r3,r4,r5)
    if(menuchoice==FOV_MENU_PAGE_1) then
        local info = getRegimeInfo(r1);
        player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,r1);
    elseif(menuchoice==FOV_MENU_PAGE_2) then
        local info = getRegimeInfo(r2);
        player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,r2);
    elseif(menuchoice==FOV_MENU_PAGE_3) then
        local info = getRegimeInfo(r3);
        player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,r3);
    elseif(menuchoice==FOV_MENU_PAGE_4) then
        local info = getRegimeInfo(r4);
        player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,r4);
    elseif(menuchoice==FOV_MENU_PAGE_5) then
        local info = getRegimeInfo(r5);
        player:updateEvent(info.n1,info.n2,info.n3,info.n4,0,info.sl,info.el,r5);
    elseif(menuchoice==FOV_MENU_VIEW_REGIME) then --View Regime (this option is only available if they have a regime active!)
        --get regime id and numbers killed...
        local regid = player:getVar("fov_regimeid");
        local info = getRegimeInfo(regid);
        if (info.n1 ~= 0) then n1 = player:getVar("fov_numkilled1"); else n1 = 0; end;
        if (info.n2 ~= 0) then n2 = player:getVar("fov_numkilled2"); else n2 = 0; end;
        if (info.n3 ~= 0) then n3 = player:getVar("fov_numkilled3"); else n3 = 0; end;
        if (info.n4 ~= 0) then n4 = player:getVar("fov_numkilled4"); else n4 = 0; end;
        player:updateEvent(info.n1,info.n2,info.n3,info.n4,n1,n2,n3,n4);
    elseif(menuchoice==FOV_MENU_LEVEL_RANGE) then --Level range and training area on View Regime...
        local regid = player:getVar("fov_regimeid");
        local info = getRegimeInfo(regid);
        player:updateEvent(0,0,0,0,0,info.sl,info.el,0);
    end
end

------------------------------------------
-- Finish FoV onEventFinish
------------------------------------------

function finishFov(player,csid,option,r1,r2,r3,r4,r5,msg_offset)
local msg_accept = msg_offset;
local msg_jobs = msg_offset+1;
local msg_cancel = msg_offset+2;
-- ================= FIELD SUPPORT ===============================================
if(option==FOV_MENU_REGEN) then --Chose Regen. Regen from FoV removes all forms of regen.
	--Decrease tabs
	local tabs = player:getVar("tabs");
    if (tabs >= 20) then
        player:setVar("tabs",tabs-20);
        --Removes regen if on player
        player:delStatusEffect(EFFECT_REGEN);
        --Adds regen
        player:addStatusEffect(EFFECT_REGEN,1,3,3600);
    end
elseif(option==FOV_MENU_REFRESH) then --Chose Refresh, removes all other refresh.
	--Decrease tabs
	local tabs = player:getVar("tabs");
    if (tabs >= 20) then
        player:setVar("tabs",tabs-20);
        --Removes refresh if on player
        player:delStatusEffect(EFFECT_REFRESH);
        --Add refresh
        player:addStatusEffect(EFFECT_REFRESH,1,3,3600);
    end
elseif(option==FOV_MENU_PROTECT) then --Chose Protect, removes all other protect.
	--Decrease tabs
	local tabs = player:getVar("tabs");
    if (tabs >= 15) then
        player:setVar("tabs",tabs-15);
        --Removes protect if on player
        player:delStatusEffect(EFFECT_PROTECT);
        --Work out how much def to give (highest tier dependant on level)
        local def = 0;
        if (player:getMainLvl()<27) then --before protect 2, give protect 1
            def=10;
        elseif (player:getMainLvl()>=27 and player:getMainLvl()<47) then --after p2, before p3
            def=25;
        elseif (player:getMainLvl()>=47 and player:getMainLvl()<63) then --after p3, before p4
            def=40;
        elseif (player:getMainLvl()>=63) then --after p4
            def=55;
        end
        --Add protect
        player:addStatusEffect(EFFECT_PROTECT,def,0,1800);
    end
elseif(option==FOV_MENU_SHELL) then --Chose Shell, removes all other shell.
	--Decrease tabs
	local tabs = player:getVar("tabs");
    if (tabs >= 15) then
        player:setVar("tabs",tabs-15);
        --Removes shell if on player
        player:delStatusEffect(EFFECT_SHELL);
        --Work out how much mdef to give (highest tier dependant on level)
        --values taken from Shell scripts by Tenjou.
        local def = 0;
        if (player:getMainLvl()<37) then --before shell 2, give shell 1
            def=-24;
        elseif (player:getMainLvl()>=37 and player:getMainLvl()<57) then --after s2, before s3
            def=-36;
        elseif (player:getMainLvl()>=57 and player:getMainLvl()<68) then --after s3, before s4
            def=-48;
        elseif (player:getMainLvl()>=68) then --after s4
            def=-56;
        end
        --Add shell
        player:addStatusEffect(EFFECT_SHELL,def,0,1800);
    end
elseif (option==FOV_MENU_RERAISE) then --Reraise chosen.
	--Decrease tabs
	local tabs = player:getVar("tabs");
    if (tags >= 10) then
        player:setVar("tabs",tabs-10);
        --Remove any other RR
        player:delStatusEffect(EFFECT_RERAISE);
        --apply RR1, 2 hour duration.
        player:addStatusEffect(EFFECT_RERAISE,1,0,7200);
    end
elseif (option==FOV_MENU_HOME_NATION) then --Return to home nation.
	--Decrease tabs
	local tabs = player:getVar("tabs");
    if (tabs >= 50) then
        player:setVar("tabs",tabs-50);
        toHomeNation(player);
    end
elseif(option==149) then --chose Hard Cookie, INT +4, MP +30 for 30 minutes 
--effect = player:getStatusEffect(EFFECT_FOOD);
--end
elseif(option==FOV_MENU_CANCEL_REGIME) then --Cancelled Regime.
	player:setVar("fov_regimeid",0);
	player:setVar("fov_numkilled1",0);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",0);
	player:setVar("fov_numkilled4",0);
	player:showText(player,msg_cancel);
elseif(option==FOV_MENU_PAGE_1) then --Page 1
	writeRegime(player,r1,msg_accept,msg_jobs,0);
elseif(option==FOV_MENU_PAGE_2) then --Page 2
	writeRegime(player,r2,msg_accept,msg_jobs,0);
elseif(option==FOV_MENU_PAGE_3) then --Page 3
	writeRegime(player,r3,msg_accept,msg_jobs,0);
elseif(option==FOV_MENU_PAGE_4) then --Page 4
	writeRegime(player,r4,msg_accept,msg_jobs,0);
elseif(option==FOV_MENU_PAGE_5) then --Page 5
	writeRegime(player,r5,msg_accept,msg_jobs,1);
elseif(option==FOV_MENU_REPEAT_REGIME1) then --Page 1 Repeat
	writeRegime(player,r1,msg_accept,msg_jobs,1);
elseif(option==FOV_MENU_REPEAT_REGIME2) then --Page 2 Repeat
	writeRegime(player,r2,msg_accept,msg_jobs,1);
elseif(option==FOV_MENU_REPEAT_REGIME3) then --Page 3 Repeat
	writeRegime(player,r3,msg_accept,msg_jobs,1);
elseif(option==FOV_MENU_REPEAT_REGIME4) then --Page 4 Repeat
	writeRegime(player,r4,msg_accept,msg_jobs,1);
elseif(option==FOV_MENU_REPEAT_REGIME5) then --Page 5 Repeat
	writeRegime(player,r5,msg_accept,msg_jobs,1);
elseif(option==FOV_MENU_ELITE_INTRO) then --Want elite, 100tabs
	--giveEliteRegime(player,ELITE_TRAINING_CHAPTER_7,100);
elseif(option==FOV_MENU_ELITE_CHAP1) then --Want elite, 150tabs
	--local tabs = player:getVar("tabs");
	--local newtabs = tabs-150;
	--player:setVar("tabs",newtabs);
elseif(option==FOV_MENU_ELITE_CHAP2) then --Want elite, 200tabs
	--local tabs = player:getVar("tabs");
	--local newtabs = tabs-200;
	--player:setVar("tabs",newtabs);
elseif(option==FOV_MENU_ELITE_CHAP3) then --Want elite, 250tabs
elseif(option==FOV_MENU_ELITE_CHAP4) then --Want elite, 300tabs
elseif(option==FOV_MENU_ELITE_CHAP5) then --Want elite, 350tabs
elseif(option==FOV_MENU_ELITE_CHAP6) then --Want elite, 400tabs
elseif(option==FOV_MENU_ELITE_CHAP7) then --Want elite, 450tabs

else
	--print("opt is "..option);
end

end

function giveEliteRegime(player,keyitem,cost)
	if(player:hasKeyItem(keyitem)) then
		--print("has");
		--player:messageBasic(98,keyitem);
	else
		local tabs = player:getVar("tabs");
		local newtabs = tabs-cost;
		player:setVar("tabs",newtabs);
		player:addKeyItem(keyitem);
	end
end

-----------------------------------
--Writes the chosen Regime to the SQL database
-----------------------------------

function writeRegime(player,rid,msg_accept,msg_jobs,regrepeat)
	player:setVar("fov_regimeid",rid);
    player:setVar("fov_repeat",regrepeat);
    player:setVar("fov_numkilled1",0);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",0);
	player:setVar("fov_numkilled4",0);
    local info = getRegimeInfo(rid);
	player:setVar("fov_numneeded1",info.n1);
	player:setVar("fov_numneeded2",info.n2);
	player:setVar("fov_numneeded3",info.n3);
	player:setVar("fov_numneeded4",info.n4);

	player:showText(player,msg_accept);
	player:showText(player,msg_jobs);
end

-----------------------------------
-- killer, mob, regime ID, index in the list of mobs to kill that this mob corresponds to (1-4)
-----------------------------------

function checkRegime(killer,mob,rid,index)

	if(killer:getVar("fov_regimeid") == rid) then --player is doing this regime
		if ((killer:checkSoloPartyAlliance() < 2) and (mob:checkBaseExp()) and (killer:checkDistance(mob) < 100)) then
		--if ((killer:getMainLvl()-mob:getMainLvl() <= PLAYER_ABOVE_MOBLEVEL_DIFF and killer:getMainLvl()-mob:getMainLvl() >= 0) or (mob:getMainLvl()-killer:getMainLvl() <= PLAYER_BELOW_MOBLEVEL_DIFF and mob:getMainLvl()-killer:getMainLvl() >= 0)) then
            --get the number of mobs needed/killed
            local needed = killer:getVar("fov_numneeded"..index);
            local killed = killer:getVar("fov_numkilled"..index);
            
			if(killed < needed) then --increment killed number and save.
				killed = killed+1;
				killer:messageBasic(FOV_MSG_KILLED_TARGET,killed,needed);
                killer:setVar("fov_numkilled"..index,killed);
                
                if(killed == needed) then
                    local fov_info = getRegimeInfo(rid);
                    local k1 = killer:getVar("fov_numkilled1"); 
                    local k2 = killer:getVar("fov_numkilled2"); 
                    local k3 = killer:getVar("fov_numkilled3"); 
                    local k4 = killer:getVar("fov_numkilled4");
                    
                    if(k1==fov_info.n1 and k2==fov_info.n2 and k3==fov_info.n3 and k4==fov_info.n4) then
                        --complete regime
                        killer:messageBasic(FOV_MSG_COMPLETED_REGIME);
                        reward = getRegimeReward(rid);
                        tabs = killer:getVar("tabs");
                        tabs = tabs+math.floor((reward/10));
                        killer:setVar("tabs",tabs);
                        killer:messageBasic(FOV_MSG_GET_TABS,math.floor((reward/10)),tabs);
                        killer:addGil(reward);
                        --TODO: display msgs (based on zone annoyingly, so will need killer:getZone() then a lookup)
                        killer:addExp(reward);
                        if (k1 ~= 0) then killer:setVar("fov_numkilled1",0); end
                        if (k2 ~= 0) then killer:setVar("fov_numkilled2",0); end
                        if (k3 ~= 0) then killer:setVar("fov_numkilled3",0); end
                        if (k4 ~= 0) then killer:setVar("fov_numkilled4",0); end
                        if(killer:getVar("fov_repeat") ~= 1) then
                            killer:setVar("fov_regimeid",0);
                            killer:setVar("fov_numneeded1",0);
                            killer:setVar("fov_numneeded2",0);
                            killer:setVar("fov_numneeded3",0);
                            killer:setVar("fov_numneeded4",0);
                        else
                        --message what you start repeat
                        end
                    end
                end
            end
		end
	end
end

------------------------------------
--     Regime Reward Database     --
--         Author: Kegsay         --
------------------------------------

--Notes: Regime ID searching has been split to a series of grouped if's.
--This means in a worst case scenario, only ~13 checks need to be made, not 150+.
--This has been done for efficiency, please do not remove.

function getRegimeReward(regimeid)
if (regimeid<=50) then 
	if(regimeid<=10) then
		if (regimeid==1) then
			return 270;
		end
		if (regimeid==2) then
			return 285;
		end
		if (regimeid==3) then
			return 300;
		end
		if (regimeid==4) then
			return 315;
		end
		if (regimeid==5) then
			return 330;
		end
		if (regimeid==6) then
			return 390;
		end
		if (regimeid==7) then
			return 475;
		end
		if (regimeid==8) then
			return 500;
		end
		if (regimeid==9) then
			return 525;
		end
		if (regimeid==10) then
			return 550;
		end
	elseif (regimeid>10 and regimeid<=20) then
		if (regimeid==11) then
			return 540;
		end
		if (regimeid==12) then
			return 570;
		end
		if (regimeid==13) then
			return 600;
		end
		if (regimeid==14) then
			return 630;
		end
		if (regimeid==15) then
			return 670;
		end
		if (regimeid==16) then
			return 270;
		end
		if (regimeid==17) then
			return 285;
		end
		if (regimeid==18) then
			return 300;
		end
		if (regimeid==19) then
			return 315;
		end
		if (regimeid==20) then
			return 330;
		end
	elseif (regimeid>20 and regimeid<=30) then
		if (regimeid==21) then
			return 540;
		end
		if (regimeid==22) then
			return 570;
		end
		if (regimeid==23) then
			return 600;
		end
		if (regimeid==24) then
			return 630;
		end
		if (regimeid==25) then
			return 690;
		end
		if (regimeid==26) then
			return 270;
		end
		if (regimeid==27) then
			return 285;
		end
		if (regimeid==28) then
			return 300;
		end
		if (regimeid==29) then
			return 315;
		end
		if (regimeid==30) then
			return 330;
		end
	elseif (regimeid>30 and regimeid<=40) then
		if (regimeid==31) then
			return 450;
		end
		if (regimeid==32) then
			return 475;
		end
		if (regimeid==33) then
			return 500;
		end
		if (regimeid==34) then
			return 525;
		end
		if (regimeid==35) then
			return 550;
		end
		if (regimeid==36) then
			return 540;
		end
		if (regimeid==37) then
			return 570;
		end
		if (regimeid==38) then
			return 600;
		end
		if (regimeid==39) then
			return 630;
		end
		if (regimeid==40) then
			return 690;
		end
	else --Regime between 41-50
		if (regimeid==41) then
			return 630;
		end
		if (regimeid==42) then
			return 665;
		end
		if (regimeid==43) then
			return 700;
		end
		if (regimeid==44) then
			return 735;
		end
		if (regimeid==45) then
			return 770;
		end
		if (regimeid==46) then
			return 810;
		end
		if (regimeid==47) then
			return 855;
		end
		if (regimeid==48) then
			return 900;
		end
		if (regimeid==49) then
			return 945;
		end
		if (regimeid==50) then
			return 990;
		end
	end
elseif (regimeid>50 and regimeid<=100) then
	if (regimeid>50 and regimeid<=60) then
		if (regimeid==51) then
			return 900;
		end
		if (regimeid==52) then
			return 950;
		end
		if (regimeid==53) then
			return 1000;
		end
		if (regimeid==54) then
			return 1050;
		end
		if (regimeid==55) then
			return 1100;
		end
		if (regimeid==56) then
			return 330;
		end
		if (regimeid==57) then
			return 575;
		end
		if (regimeid==58) then
			return 480;
		end
		if (regimeid==59) then
			return 330;
		end
		if (regimeid==60) then
			return 660;
		end
	elseif (regimeid>60 and regimeid<=70) then
		if (regimeid==61) then
			return 330;
		end
		if (regimeid==62) then
			return 575;
		end
		if (regimeid==63) then
			return 660;
		end
		if (regimeid==64) then
			return 270;
		end
		if (regimeid==65) then
			return 285;
		end
		if (regimeid==66) then
			return 300;
		end
		if (regimeid==67) then
			return 315;
		end
		if (regimeid==68) then
			return 330;
		end
		if (regimeid==69) then
			return 360;
		end
		if (regimeid==70) then
			return 420;
		end
	elseif (regimeid>70 and regimeid<=80) then
		if (regimeid==71) then
			return 450;
		end
		if (regimeid==72) then
			return 630;
		end
		if (regimeid==73) then
			return 650;
		end
		if (regimeid==74) then
			return 700;
		end
		if (regimeid==75) then
			return 730;
		end
		if (regimeid==76) then
			return 270;
		end
		if (regimeid==77) then
			return 285;
		end
		if (regimeid==78) then
			return 300;
		end
		if (regimeid==79) then
			return 315;
		end
		if (regimeid==80) then
			return 330;
		end
	elseif (regimeid>80 and regimeid<=90) then
		if (regimeid==81) then
			return 340;
		end
		if (regimeid==82) then
			return 360;
		end
		if (regimeid==83) then
			return 380;
		end
		if (regimeid==84) then
			return 400;
		end
		if (regimeid==85) then
			return 670;
		end
		if (regimeid==86) then
			return 710;
		end
		if (regimeid==87) then
			return 740;
		end
		if (regimeid==88) then
			return 800;
		end
		if (regimeid==89) then
			return 270;
		end
		if (regimeid==90) then
			return 285;
		end
	else --Regime 91-100
		if (regimeid==91) then
			return 300;
		end
		if (regimeid==92) then
			return 315;
		end
		if (regimeid==93) then
			return 330;
		end
		if (regimeid==94) then
			return 315;
		end
		if (regimeid==95) then
			return 370;
		end
		if (regimeid==96) then
			return 475;
		end
		if (regimeid==97) then
			return 710;
		end
		if (regimeid==98) then
			return 710;
		end
		if (regimeid==99) then
			return 730;
		end
		if (regimeid==100) then
			return 770;
		end
	end
elseif (regimeid>100) then
	if (regimeid>100 and regimeid<=110) then
		if (regimeid==101) then
			return 350;
		end
		if (regimeid==102) then
			return 400;
		end
		if (regimeid==103) then
			return 450;
		end
		if (regimeid==104) then
			return 1300;
		end
		if (regimeid==105) then
			return 1320;
		end
		if (regimeid==106) then
			return 1340;
		end
		if (regimeid==107) then
			return 1390;
		end
		if (regimeid==108) then
			return 1450;
		end
		if (regimeid==109) then
			return 810;
		end
		if (regimeid==110) then
			return 830;
		end
	elseif (regimeid>110 and regimeid<=120) then
		if (regimeid==111) then
			return 870;
		end
		if (regimeid==112) then
			return 950;
		end
		if (regimeid==113) then
			return 970;
		end
		if (regimeid==114) then
			return 900;
		end
		if (regimeid==115) then
			return 940;
		end
		if (regimeid==116) then
			return 980;
		end
		if (regimeid==117) then
			return 1020;
		end
		if (regimeid==118) then
			return 1100;
		end
		if (regimeid==119) then
			return 1300;
		end
		if (regimeid==120) then
			return 1330;
		end
	elseif (regimeid>120 and regimeid<=130) then
		if (regimeid==121) then
			return 1360;
		end
		if (regimeid==122) then
			return 1540;
		end
		if (regimeid==123) then
			return 1540;
		end
		if (regimeid==124) then
			return 820;
		end
		if (regimeid==125) then
			return 840;
		end
		if (regimeid==126) then
			return 860;
		end
		if (regimeid==127) then
			return 880;
		end
		if (regimeid==128) then
			return 920;
		end
		if (regimeid==129) then
			return 840;
		end
		if (regimeid==130) then
			return 880;
		end
	elseif (regimeid>130 and regimeid<=140) then
		if (regimeid==131) then
			return 920;
		end
		if (regimeid==132) then
			return 940;
		end
		if (regimeid==133) then
			return 1000;
		end
		if (regimeid==134) then
			return 920;
		end
		if (regimeid==135) then
			return 980;
		end
		if (regimeid==136) then
			return 1020;
		end
		if (regimeid==137) then
			return 1080;
		end
		if (regimeid==138) then
			return 1140;
		end
		if (regimeid==139) then
			return 1220;
		end
		if (regimeid==140) then
			return 1260;
		end
	else --Regime 140-146
		if (regimeid==141) then
			return 1300;
		end
		if (regimeid==142) then
			return 1450;
		end
		if (regimeid==143) then
			return 1500;
		end
		if (regimeid==144) then
			return 1550;
		end
		if (regimeid==145) then
			return 1600;
		end
		if (regimeid==146) then
			return 1600;
		end
	end
	--print("Warning: Regime ID not found! Returning reward as 10.");
	return 10;
end
end

-------------------
-- Regime Information Database
-- Stores details on the number of monsters to kill
-- as well as the suggested level range.
-- n1,n2,n3,n4 = Number of monsters needed
-- sl = Start Level range
-- s2 = End Level range
--
-- Example:
-- n1=6, n2=0, n3=0, n4=0, sl=1, el=6, Regime ID=1, produces:
-- Defeat the following monsters:
--  6 Worms
--  Level range 1 ~ 6
--  Area: West Ronfaure
-------------------
function getRegimeInfo(regimeid)
a = {};
if (regimeid<=50) then 
	if(regimeid<=10) then
		if (regimeid==1) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=1;
			a.el=6;
			return a;
		end
		if (regimeid==2) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=2;
			a.el=6;
			return a;
		end
		if (regimeid==3) then
			a.n1=5;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=4;
			a.el=7;
			return a;
		end
		if (regimeid==4) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=4;
			a.el=8;
			return a;
		end
		if (regimeid==5) then
			a.n1=3;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=8;
			a.el=12;
			return a;
		end
		if (regimeid==6) then
			a.n1=8;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=12;
			a.el=13;
			return a;
		end
		if (regimeid==7) then
			a.n1=7;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=15;
			a.el=19;
			return a;
		end
		if (regimeid==8) then
			a.n1=6;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=15;
			a.el=22;
			return a;
		end
		if (regimeid==9) then
			a.n1=5;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=18;
			a.el=23;
			return a;
		end
		if (regimeid==10) then
			a.n1=4;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=20;
			a.el=23;
			return a;
		end
	elseif (regimeid>10 and regimeid<=20) then
		if (regimeid==11) then
			a.n1=9;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=21;
			a.el=22;
			return a;
		end
		if (regimeid==12) then
			a.n1=8;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=21;
			a.el=23;
			return a;
		end
		if (regimeid==13) then
			a.n1=7;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=22;
			a.el=25;
			return a;
		end
		if (regimeid==14) then
			a.n1=6;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=24;
			a.el=25;
			return a;
		end
		if (regimeid==15) then
			a.n1=4;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=25;
			a.el=28;
			return a;
		end
		if (regimeid==16) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=1;
			a.el=6;
			return a;
		end
		if (regimeid==17) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=6;
			return a;
		end
		if (regimeid==18) then
			a.n1=5;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=7;
			return a;
		end
		if (regimeid==19) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=8;
			return a;
		end
		if (regimeid==20) then
			a.n1=3;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=10;
			a.el=12;
			return a;
		end
	elseif (regimeid>20 and regimeid<=30) then
		if (regimeid==21) then
			a.n1=9;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=20;
			a.el=21;
			return a;
		end
		if (regimeid==22) then
			a.n1=8;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=20;
			a.el=22;
			return a;
		end
		if (regimeid==23) then
			a.n1=7;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=21;
			a.el=23;
			return a;
		end
		if (regimeid==24) then
			a.n1=6;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=22;
			a.el=25;
			return a;
		end
		if (regimeid==25) then
			a.n1=4;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=25;
			a.el=28;
			return a;
		end
		if (regimeid==26) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=1;
			a.el=5;
			return a;
		end
		if (regimeid==27) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=2;
			a.el=5;
			return a;
		end
		if (regimeid==28) then
			a.n1=5;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=8;
			return a;
		end
		if (regimeid==29) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=4;
			a.el=8;
			return a;
		end
		if (regimeid==30) then
			a.n1=3;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=7;
			a.el=12;
			return a;
		end
	elseif (regimeid>30 and regimeid<=40) then
		if (regimeid==31) then
			a.n1=8;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=11;
			a.el=13;
			return a;
		end
		if (regimeid==32) then
			a.n1=7;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=15;
			a.el=19;
			return a;
		end
		if (regimeid==33) then
			a.n1=6;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=15;
			a.el=23;
			return a;
		end
		if (regimeid==34) then
			a.n1=5;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=20;
			a.el=24;
			return a;
		end
		if (regimeid==35) then
			a.n1=4;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=21;
			a.el=24;
			return a;
		end
		if (regimeid==36) then
			a.n1=9;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=20;
			a.el=21;
			return a;
		end
		if (regimeid==37) then
			a.n1=8;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=20;
			a.el=22;
			return a;
		end
		if (regimeid==38) then
			a.n1=7;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=21;
			a.el=23;
			return a;
		end
		if (regimeid==39) then
			a.n1=6;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=22;
			a.el=25;
			return a;
		end
		if (regimeid==40) then
			a.n1=4;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=25;
			a.el=28;
			return a;
		end
	else --Regime between 41-50
		if (regimeid==41) then
			a.n1=9;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=26;
			a.el=29;
			return a;
		end
		if (regimeid==42) then
			a.n1=8;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=26;
			a.el=29;
			return a;
		end
		if (regimeid==43) then
			a.n1=7;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=28;
			a.el=29;
			return a;
		end
		if (regimeid==44) then
			a.n1=6;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=28;
			a.el=30;
			return a;
		end
		if (regimeid==45) then
			a.n1=5;
			a.n2=4;
			a.n3=1;
			a.n4=0;
			a.sl=28;
			a.el=34;
			return a;
		end
		if (regimeid==46) then
			a.n1=9;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=34;
			a.el=38;
			return a;
		end
		if (regimeid==47) then
			a.n1=8;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=34;
			a.el=39;
			return a;
		end
		if (regimeid==48) then
			a.n1=7;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=37;
			a.el=42;
			return a;
		end
		if (regimeid==49) then
			a.n1=6;
			a.n2=4;
			a.n3=1;
			a.n4=0;
			a.sl=37;
			a.el=43;
			return a;
		end
		if (regimeid==50) then
			a.n1=5;
			a.n2=4;
			a.n3=2;
			a.n4=0;
			a.sl=40;
			a.el=43;
			return a;
		end
	end
elseif (regimeid>50 and regimeid<=100) then
	if (regimeid>50 and regimeid<=60) then
		if (regimeid==51) then
			a.n1=9;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=42;
			a.el=46;
			return a;
		end
		if (regimeid==52) then
			a.n1=8;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=42;
			a.el=45;
			return a;
		end
		if (regimeid==53) then
			a.n1=7;
			a.n2=4;
			a.n3=1;
			a.n4=0;
			a.sl=42;
			a.el=48;
			return a;
		end
		if (regimeid==54) then
			a.n1=6;
			a.n2=4;
			a.n3=2;
			a.n4=0;
			a.sl=42;
			a.el=48;
			return a;
		end
		if (regimeid==55) then
			a.n1=5;
			a.n2=4;
			a.n3=3;
			a.n4=0;
			a.sl=45;
			a.el=52;
			return a;
		end
		if (regimeid==56) then
			a.n1=6;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=4;
			a.el=8;
			return a;
		end
		if (regimeid==57) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=22;
			a.el=25;
			return a;
		end
		if (regimeid==58) then
			a.n1=8;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=15;
			a.el=18;
			return a;
		end
		if (regimeid==59) then
			a.n1=3;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=8;
			return a;
		end
		if (regimeid==60) then
			a.n1=5;
			a.n2=4;
			a.n3=1;
			a.n4=0;
			a.sl=22;
			a.el=25;
			return a;
		end
	elseif (regimeid>60 and regimeid<=70) then
		if (regimeid==61) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=4;
			a.el=8;
			return a;
		end
		if (regimeid==62) then
			a.n1=4;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=22;
			a.el=27;
			return a;
		end
		if (regimeid==63) then
			a.n1=3;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=25;
			a.el=27;
			return a;
		end
		if (regimeid==64) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=1;
			a.el=5;
			return a;
		end
		if (regimeid==65) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=2;
			a.el=5;
			return a;
		end
		if (regimeid==66) then
			a.n1=7;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=2;
			a.el=6;
			return a;
		end
		if (regimeid==67) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=6;
			return a;
		end
		if (regimeid==68) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=4;
			a.el=8;
			return a;
		end
		if (regimeid==69) then
			a.n1=3;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=11;
			a.el=13;
			return a;
		end
		if (regimeid==70) then
			a.n1=5;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=11;
			a.el=14;
			return a;
		end
	elseif (regimeid>70 and regimeid<=80) then
		if (regimeid==71) then
			a.n1=5;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=10;
			a.el=15;
			return a;
		end
		if (regimeid==72) then
			a.n1=5;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=23;
			a.el=26;
			return a;
		end
		if (regimeid==73) then
			a.n1=5;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=23;
			a.el=28;
			return a;
		end
		if (regimeid==74) then
			a.n1=5;
			a.n2=2;
			a.n3=2;
			a.n4=0;
			a.sl=26;
			a.el=32;
			return a;
		end
		if (regimeid==75) then
			a.n1=9;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=31;
			a.el=32;
			return a;
		end
		if (regimeid==76) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=1;
			a.el=6;
			return a;
		end
		if (regimeid==77) then
			a.n1=7;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=2;
			a.el=5;
			return a;
		end
		if (regimeid==78) then
			a.n1=3;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=6;
			return a;
		end
		if (regimeid==79) then
			a.n1=7;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=6;
			return a;
		end
		if (regimeid==80) then
			a.n1=5;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=4;
			a.el=8;
			return a;
		end
	elseif (regimeid>80 and regimeid<=90) then
		if (regimeid==81) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=8;
			a.el=11;
			return a;
		end
		if (regimeid==82) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=9;
			a.el=12;
			return a;
		end
		if (regimeid==83) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=9;
			a.el=15;
			return a;
		end
		if (regimeid==84) then
			a.n1=2;
			a.n2=2;
			a.n3=2;
			a.n4=0;
			a.sl=12;
			a.el=14;
			return a;
		end
		if (regimeid==85) then
			a.n1=5;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=25;
			a.el=26;
			return a;
		end
		if (regimeid==86) then
			a.n1=6;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=26;
			a.el=32;
			return a;
		end
		if (regimeid==87) then
			a.n1=6;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=27;
			a.el=33;
			return a;
		end
		if (regimeid==88) then
			a.n1=5;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=36;
			a.el=37;
			return a;
		end
		if (regimeid==89) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=1;
			a.el=6;
			return a;
		end
		if (regimeid==90) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=1;
			a.el=8;
			return a;
		end
	else --Regime 91-100
		if (regimeid==91) then
			a.n1=6;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=2;
			a.el=6;
			return a;
		end
		if (regimeid==92) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=6;
			return a;
		end
		if (regimeid==93) then
			a.n1=4;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=3;
			a.el=6;
			return a;
		end
		if (regimeid==94) then
			a.n1=4;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=7;
			a.el=11;
			return a;
		end
		if (regimeid==95) then
			a.n1=3;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=8;
			a.el=12;
			return a;
		end
		if (regimeid==96) then
			a.n1=3;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=12;
			a.el=16;
			return a;
		end
		if (regimeid==97) then
			a.n1=4;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=26;
			a.el=32;
			return a;
		end
		if (regimeid==98) then
			a.n1=2;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=26;
			a.el=34;
			return a;
		end
		if (regimeid==99) then
			a.n1=3;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=27;
			a.el=33;
			return a;
		end
		if (regimeid==100) then
			a.n1=5;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=36;
			a.el=38;
			return a;
		end
	end
elseif (regimeid>100) then
	if (regimeid>100 and regimeid<=110) then
		if (regimeid==101) then
			a.n1=3;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=41;
			a.el=44;
			return a;
		end
		if (regimeid==102) then
			a.n1=3;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=41;
			a.el=46;
			return a;
		end
		if (regimeid==103) then
			a.n1=3;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=43;
			a.el=47;
			return a;
		end
		if (regimeid==104) then
			a.n1=4;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=62;
			a.el=66;
			return a;
		end
		if (regimeid==105) then
			a.n1=4;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=64;
			a.el=68;
			return a;
		end
		if (regimeid==106) then
			a.n1=4;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=64;
			a.el=69;
			return a;
		end
		if (regimeid==107) then
			a.n1=7;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=66;
			a.el=74;
			return a;
		end
		if (regimeid==108) then
			a.n1=4;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=71;
			a.el=79;
			return a;
		end
		if (regimeid==109) then
			a.n1=10;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=30;
			a.el=34;
			return a;
		end
		if (regimeid==110) then
			a.n1=3;
			a.n2=1;
			a.n3=7;
			a.n4=0;
			a.sl=35;
			a.el=40;
			return a;
		end
	elseif (regimeid>110 and regimeid<=120) then
		if (regimeid==111) then
			a.n1=3;
			a.n2=1;
			a.n3=7;
			a.n4=0;
			a.sl=35;
			a.el=44;
			return a;
		end
		if (regimeid==112) then
			a.n1=5;
			a.n2=2;
			a.n3=2;
			a.n4=1;
			a.sl=44;
			a.el=49;
			return a;
		end
		if (regimeid==113) then
			a.n1=3;
			a.n2=3;
			a.n3=2;
			a.n4=1;
			a.sl=45;
			a.el=49;
			return a;
		end
		if (regimeid==114) then
			a.n1=7;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=40;
			a.el=44;
			return a;
		end
		if (regimeid==115) then
			a.n1=7;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=41;
			a.el=46;
			return a;
		end
		if (regimeid==116) then
			a.n1=7;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=41;
			a.el=46;
			return a;
		end
		if (regimeid==117) then
			a.n1=7;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=42;
			a.el=47;
			return a;
		end
		if (regimeid==118) then
			a.n1=3;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=44;
			a.el=50;
			return a;
		end
		if (regimeid==119) then
			a.n1=3;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=60;
			a.el=65;
			return a;
		end
		if (regimeid==120) then
			a.n1=7;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=64;
			a.el=69;
			return a;
		end
	elseif (regimeid>120 and regimeid<=130) then
		if (regimeid==121) then
			a.n1=7;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=65;
			a.el=69;
			return a;
		end
		if (regimeid==122) then
			a.n1=6;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=78;
			a.el=82;
			return a;
		end
		if (regimeid==123) then
			a.n1=6;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=79;
			a.el=82;
			return a;
		end
		if (regimeid==124) then
			a.n1=4;
			a.n2=5;
			a.n3=0;
			a.n4=0;
			a.sl=30;
			a.el=35;
			return a;
		end
		if (regimeid==125) then
			a.n1=7;
			a.n2=4;
			a.n3=0;
			a.n4=0;
			a.sl=32;
			a.el=37;
			return a;
		end
		if (regimeid==126) then
			a.n1=10;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=34;
			a.el=36;
			return a;
		end
		if (regimeid==127) then
			a.n1=4;
			a.n2=6;
			a.n3=0;
			a.n4=0;
			a.sl=34;
			a.el=38;
			return a;
		end
		if (regimeid==128) then
			a.n1=4;
			a.n2=6;
			a.n3=0;
			a.n4=0;
			a.sl=34;
			a.el=41;
			return a;
		end
		if (regimeid==129) then
			a.n1=3;
			a.n2=6;
			a.n3=0;
			a.n4=0;
			a.sl=35;
			a.el=39;
			return a;
		end
		if (regimeid==130) then
			a.n1=3;
			a.n2=6;
			a.n3=0;
			a.n4=0;
			a.sl=35;
			a.el=40;
			return a;
		end
	elseif (regimeid>130 and regimeid<=140) then
		if (regimeid==131) then
			a.n1=10;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=40;
			a.el=44;
			return a;
		end
		if (regimeid==132) then
			a.n1=7;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=40;
			a.el=46;
			return a;
		end
		if (regimeid==133) then
			a.n1=10;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=45;
			a.el=49;
			return a;
		end
		if (regimeid==134) then
			a.n1=7;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=40;
			a.el=45;
			return a;
		end
		if (regimeid==135) then
			a.n1=5;
			a.n2=1;
			a.n3=4;
			a.n4=0;
			a.sl=44;
			a.el=49;
			return a;
		end
		if (regimeid==136) then
			a.n1=10;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=47;
			a.el=53;
			return a;
		end
		if (regimeid==137) then
			a.n1=2;
			a.n2=8;
			a.n3=0;
			a.n4=0;
			a.sl=51;
			a.el=56;
			return a;
		end
		if (regimeid==138) then
			a.n1=4;
			a.n2=6;
			a.n3=0;
			a.n4=0;
			a.sl=54;
			a.el=58;
			return a;
		end
		if (regimeid==139) then
			a.n1=5;
			a.n2=2;
			a.n3=0;
			a.n4=0;
			a.sl=66;
			a.el=72;
			return a;
		end
		if (regimeid==140) then
			a.n1=5;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=66;
			a.el=74;
			return a;
		end
	else --Regime 140-146
		if (regimeid==141) then
			a.n1=4;
			a.n2=1;
			a.n3=0;
			a.n4=0;
			a.sl=69;
			a.el=74;
			return a;
		end
		if (regimeid==142) then
			a.n1=8;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=72;
			a.el=76;
			return a;
		end
		if (regimeid==143) then
			a.n1=8;
			a.n2=3;
			a.n3=0;
			a.n4=0;
			a.sl=73;
			a.el=78;
			return a;
		end
		if (regimeid==144) then
			a.n1=11;
			a.n2=0;
			a.n3=0;
			a.n4=0;
			a.sl=75;
			a.el=78;
			return a;
		end
		if (regimeid==145) then
			a.n1=2;
			a.n2=2;
			a.n3=2;
			a.n4=0;
			a.sl=78;
			a.el=79;
			return a;
		end
		if (regimeid==146) then
			a.n1=2;
			a.n2=2;
			a.n3=2;
			a.n4=0;
			a.sl=78;
			a.el=79;
			return a;
		end
	end
end
	--print("Warning: Regime ID not found! Returning blank array.");
	a.n1 = 0;
	a.n2 = 0;
	a.n3 = 0;
	a.n4 = 0;
	a.sl = 0;
	a.el = 0;
	return a;
end