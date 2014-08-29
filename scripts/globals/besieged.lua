

-----------------------------------------------------------------
-- Variable for getNationTeleport and getRegionPoint
-----------------------------------------------------------------

IS = 3;
ZENI = 10;
AHTURHGAN = 3;
LEUJAOAM_ASSAULT_POINT = 0;
MAMOOL_ASSAULT_POINT = 1;
LEBROS_ASSAULT_POINT = 2;
PERIQIA_ASSAULT_POINT = 3;
ILRUSI_ASSAULT_POINT = 4;
NYZUL_ISLE_ASSAULT_POINT = 5;

-----------------------------------
-- hasRunicPortal Action
-----------------------------------

function hasRunicPortal(player,portal)
	
	local runicPortal = player:getNationTeleport(AHTURHGAN);
	local bit = {};
	
	for i = 6,1,-1 do
		twop = 2^i
		
		if(runicPortal >= twop) then
			bit[i]=1; runicPortal = runicPortal - twop;
		else
			bit[i]=0;
		end
	end;
	
	return bit[portal];
	
end;

-----------------------------------
-- hasAssaultOrders Action
-----------------------------------

function hasAssaultOrders(player)
	
	local event = 0;
    local keyitem = 0;
	
	if(player:hasKeyItem(LEUJAOAM_ASSAULT_ORDERS)) then -- assault @ Azouph Isle
		event = 0x0078;
        keyitem = LEUJAOAM_ASSAULT_ORDERS;
	elseif(player:hasKeyItem(MAMOOL_JA_ASSAULT_ORDERS)) then -- assault @ Mamool Ja 
		event = 0x0079;
        keyitem = MAMOOL_JA_ASSAULT_ORDERS;
	elseif(player:hasKeyItem(LEBROS_ASSAULT_ORDERS)) then -- assault @ Halvung	
		event = 0x007A;
        keyitem = LEBROS_ASSAULT_ORDERS;
	elseif(player:hasKeyItem(PERIQIA_ASSAULT_ORDERS)) then -- assault @ Dvucca Isle 
		event = 0x007B;
        keyitem = PERIQIA_ASSAULT_ORDERS;
	elseif(player:hasKeyItem(ILRUSI_ASSAULT_ORDERS)) then -- assault @ 	 Ilrusi Atoll 
		event = 0x007C;
        keyitem = ILRUSI_ASSAULT_ORDERS;
	elseif(player:hasKeyItem(NYZUL_ISLE_ASSAULT_ORDERS)) then -- assault @  Nyzul Isle
		event = 0x007D;
        keyitem = NYZUL_ISLE_ASSAULT_ORDERS;
	end
	
	return event, keyitem;
	
end;

-----------------------------------------------------------------
-- function getMapBitmask(player) returns the map bitmask neded by
-- sanction NPCs.
------------------------------------------------------------------

function getMapBitmask(player)
	
	if(player:hasKeyItem(1862)) then mamook = 1 else mamook = 0; end -- Map of Mammok
	if(player:hasKeyItem(1863)) then halvung = 1 else halvung = 0; end -- Map of Halvung
	if(player:hasKeyItem(1864)) then arrapago = 1 else arrapago = 0; end -- Map of Arrapago Reef
	local maps = mamook + 2 * halvung + 4 * arrapago;
	
	return maps;
	
end;

-----------------------------------------------------------------
-- function getAstralCandescence() returns 1 ifthe Astral 
-- Candescence is in Al Zahbi, 0 otherwise. Hardcoded 1 for now.
------------------------------------------------------------------

function getAstralCandescence()
	return 1;
end;

-----------------------------------------------------------------
-- function getMercenaryRank(player) returns the numerical mercenary
-- rank of the player. rank 0 means not signed, rank 11 Captain.
------------------------------------------------------------------

local badges = { 0x030C, 0x030F, 0x0310, 0x031A, 0x031B, 0x0339, 0x033A, 0x033B, 0x037E, 0x0384, 0x38D }

function getMercenaryRank(player)
	
	rank = 0;
	
	while player:hasKeyItem(badges[rank + 1]) == true do
		rank = rank + 1;
	end;
	
	return rank;
	
end;

function geteRecommendedAssaultLevel(assaultid)
    if assaultid == 1 then
        return 50;
    elseif assaultid == 2 then
        return 50;
    elseif assaultid == 3 then
        return 60;
    elseif assaultid == 4 then
        return 50;
    elseif assaultid == 5 then
        return 60;
    elseif assaultid == 6 then
        return 70;
    elseif assaultid == 7 then
        return 70;
    elseif assaultid == 8 then
        return 70;
    elseif assaultid == 9 then
        return 70;
    elseif assaultid == 10 then
        return 70;
    elseif assaultid == 11 then
        return 60;
    elseif assaultid == 12 then
        return 60;
    elseif assaultid == 13 then
        return 70;
    elseif assaultid == 14 then
        return 60;
    elseif assaultid == 15 then
        return 70;
    elseif assaultid == 16 then
        return 50;
    elseif assaultid == 17 then
        return 70;
    elseif assaultid == 18 then
        return 70;
    elseif assaultid == 19 then
        return 70;
    elseif assaultid == 20 then
        return 70;
    elseif assaultid == 21 then
        return 50;
    elseif assaultid == 22 then
        return 60;
    elseif assaultid == 23 then
        return 70;
    elseif assaultid == 24 then
        return 70;
    elseif assaultid == 25 then
        return 70;
    elseif assaultid == 26 then
        return 60;
    elseif assaultid == 27 then
        return 70;
    elseif assaultid == 28 then
        return 70;
    elseif assaultid == 29 then
        return 70;
    elseif assaultid == 30 then
        return 70;
    elseif assaultid == 31 then
        return 70;
    elseif assaultid == 32 then
        return 70;
    elseif assaultid == 33 then
        return 70;
    elseif assaultid == 34 then
        return 60;
    elseif assaultid == 35 then
        return 70;
    elseif assaultid == 36 then
        return 50;
    elseif assaultid == 37 then
        return 60;
    elseif assaultid == 38 then
        return 70;
    elseif assaultid == 39 then
        return 70;
    elseif assaultid == 40 then
        return 70;
    elseif assaultid == 41 then
        return 60;
    elseif assaultid == 42 then
        return 70;
    elseif assaultid == 43 then
        return 70;
    elseif assaultid == 44 then
        return 50;
    elseif assaultid == 45 then
        return 60;
    elseif assaultid == 46 then
        return 70;
    elseif assaultid == 47 then
        return 60;
    elseif assaultid == 48 then
        return 70;
    elseif assaultid == 49 then
        return 70;
    elseif assaultid == 50 then
        return 70;
    elseif assaultid == 51 then
        return 75;
    elseif assaultid == 52 then
        return 99;
    end;
end;

-----------------------------------------------------------------------------------
-- function getSanctionDuration(player) returns the duration of the sanction effect
-- in seconds. Duration is known to go up with mercenary rank but data published on 
-- ffxi wiki (http://wiki.ffxiclopedia.org/wiki/Sanction) is unclear and even 
-- contradictory (the page on the AC http://wiki.ffxiclopedia.org/wiki/Astral_Candescence
-- says that duration is 3-8 hours with the AC, 1-3 hours without the AC while the Sanction
-- page says it's 3-6 hours with th AC.) 
--
-- I decided to use the formula duration (with AC) = 3 hours + (mercenary rank - 1) * 20 minutes.
-----------------------------------------------------------------------------------


function getSanctionDuration(player) 
	
	local duration = 10800 + 1200*1;--(getMercenaryRank(player)-1);
	
	if(getAstralCandescence() == 0) then
		duration = duration / 2;
	end;
	
	return duration;
	
end;

-----------------------------------------------------------------------------------
-- function getImperialDefenseStats() returns:
-- *how many successive times Al Zahbi has been defended
-- *Imperial Defense Value
-- *Total number of imperial victories
-- *Total number of beastmen victories.
-- hardcoded constants for now until we have a Besieged system.
-----------------------------------------------------------------------------------

function getImperialDefenseStats()
	return 5,8,100,90;
end;

local IS_item = {}

IS_item[1] = 4182; -- scroll of Instant Reraise
IS_item[257] = 4181; -- scroll of Instant Warp
IS_item[513] = 2230 -- lambent fire cell
IS_item[769] = 2231 -- lambent water cell
IS_item[1025] = 2232 -- lambent earth cell
IS_item[1281] = 2233 -- lambent wind cell
IS_item[1537] = 19021 -- katana strap
IS_item[1793] = 19022 -- axe grip
IS_item[2049] = 19023 -- staff strap
IS_item[33] = 18689 -- volunteer's dart
IS_item[289] = 18690 -- mercenary's dart
IS_item[545] = 18691 -- Imperial dart
IS_item[49] = 18692 -- Mamoolbane
IS_item[305] = 18693 -- Lamiabane
IS_item[561] = 18694 -- Trollbane	
IS_item[817] = 15810 -- Luzaf's ring
IS_item[65] = 15698 -- sneaking boots
IS_item[321] = 15560 -- trooper's ring
IS_item[577] = 16168 -- sentinel shield
IS_item[81] = 18703 -- shark gun
IS_item[337] = 18742 -- puppet claws
IS_item[593] = 17723 -- singh kilij
IS_item[97] = 15622 -- mercenary's trousers
IS_item[353] = 15790 -- multiple ring
IS_item[609] = 15981 -- haten earring
IS_item[113] = 15623 -- volunteer's brais
IS_item[369] = 15982 -- priest's earring
IS_item[625] = 15983 -- chaotic earring
IS_item[129] = 17741 -- perdu hanger
IS_item[385] = 18943 -- perdu sickle
IS_item[641] = 18850 -- perdu wand
IS_item[897] = 18717 -- perdu bow
IS_item[145] = 16602 -- perdu sword
IS_item[401] = 18425 -- perdu blade
IS_item[657] = 18491 -- perdu voulge
IS_item[913] = 18588 -- perdu staff
IS_item[1169] = 18718 -- perdu crossbow
IS_item[161] = 16271 -- lieutenant's gorget
IS_item[417] = 15912 -- lieutenant's sash
IS_item[673] = 16230 -- lieutenant's cape

IS_price = {}

IS_price[1] = 500; -- scroll of Instant Reraise
IS_price[257] = 750; -- scroll of Instant Warp
IS_price[513] = 100; -- lambent fire cell
IS_price[769] = 100; -- lambent water cell
IS_price[1025] = 100; -- lambent earth cell
IS_price[1281] = 100; -- lambent wind cell
IS_price[1537] = 20000; -- katana strap
IS_price[1793] = 20000; -- axe grip
IS_price[2049] = 20000; -- staff strap
IS_price[33] = 18689 -- volunteer's dart
IS_price[289] = 2000; -- mercenary's dart
IS_price[545] = 2000; -- Imperial dart
IS_price[49] = 4000; -- Mamoolbane
IS_price[305] = 4000; -- Lamiabane
IS_price[561] = 4000; -- Trollbane	
IS_price[817] = 4000; -- Luzaf's ring
IS_price[65] = 8000; -- sneaking boots
IS_price[321] = 8000; -- trooper's ring
IS_price[577] = 8000; -- sentinel shield
IS_price[81] = 16000; -- shark gun
IS_price[337] = 16000; -- puppet claws
IS_price[593] = 16000; -- singh kilij
IS_price[97] = 24000; -- mercenary's trousers
IS_price[353] = 24000; -- multiple ring
IS_price[609] = 24000; -- haten earring
IS_price[113] = 32000; -- volunteer's brais
IS_price[369] = 32000; -- priest's earring
IS_price[625] = 32000; -- chaotic earring
IS_price[129] = 40000; -- perdu hanger
IS_price[385] = 40000; -- perdu sickle
IS_price[641] = 40000; -- perdu wand
IS_price[897] = 40000; -- perdu bow
IS_price[145] = 48000; -- perdu sword
IS_price[401] = 48000; -- perdu blade
IS_price[657] = 48000; -- perdu voulge
IS_price[913] = 48000; -- perdu staff
IS_price[1169] = 48000; -- perdu crossbow
IS_price[161] = 56000; -- lieutenant's gorget
IS_price[417] = 56000; -- lieutenant's sash
IS_price[673] = 56000; -- lieutenant's cape


------------------------------------------------------------------------------
-- function getISPItem(i) returns the item ID and cost of the imperial standing 
-- points item indexed by i (the same value  as that used by the vendor event.)
-------------------------------------------------------------------------------

function getISPItem(i)
	return IS_item[i],IS_price[i];
end;

-----------------------------------
-- ZNM System
-----------------------------------

local lures = { 
2580, 2581, 2582, -- hellcage butterfly, jug of floral nectar, wedge of rodent cheese
2577, 2578, 2579, -- bunch of senorita pamamas, jar of oily blood, strand of Samariri corpsehair
2574, 2575, 2576, -- bar of ferrite, bagged sheep botfly, Olzhiryan cactus paddle
2573, 			  -- jug of monkey wine
2590, 2591, 2592, -- clump of shadeleaves, beaker of pectin, flask of cog lubricant
2587, 2588, 2589, -- slab of raw buffalo, lump of bone charcoal, pinch of granulated sugar
2584, 2585, 2586, -- vial of pure blood, vinegar pie, jar of rock juice 
2583, 			  -- chunk of buffalo corpse
2600, 2601, 2602, -- pile of golden teeth, greenling, bottle of spoilt blood
2597, 2598, 2599, -- opalus gem, Merrow No. 11 molting, mint drop
2594, 2595, 2596, -- bound exorcism treatise, clump of myrrh, whole rose scampi
2593, 			  -- chunk of singed buffalo
2572} 			  -- Pandemonium key

local trophies = {
2616, 2617, 2618, -- Vulpangue's wing, Chamrosh's beak, Gigiroon's Cape
2613, 2614, 2615, -- Iriz Ima's hide, Amooshah's tendril, Iriri Samariri's hat
2610, 2611, 2612, -- Armed Gears' fragment, Gotoh Zha's necklace, Dea's horn
2609, 			  -- Tinnin's fang
2626, 2627, 2628, -- Brass Borer's cocoon, globule of Claret, Ob's arm
2623, 2624, 2625, -- Anantaboga's heart, pile of Reacton's ashes, blob of Dextrose's blubber
2620, 2621, 2622, -- Nosferatu's claw, Bhurborlor's vambrace, Achamoth's antenna
2619, 			  -- Sarameya's hide
2636, 2637, 2638, -- Velionis's bone, Lil' Apkallu's egg, Chigre
2633, 2634, 2635, -- Wulgaru's head, Zareekhl's neckpiece, Verdelet's wing
2630, 2631, 2632, -- Mahjlaef's staff, Experimental Lamia's armband, Nuhn's esca
2629 } 			  -- Tyger's tail

local seals = {
	MAROON_SEAL, MAROON_SEAL, MAROON_SEAL,
	APPLE_GREEN_SEAL,APPLE_GREEN_SEAL,APPLE_GREEN_SEAL,
	CHARCOAL_GREY_SEAL, DEEP_PURPLE_SEAL, CHESTNUT_COLORED_SEAL,
	LILAC_COLORED_SEAL,
	CERISE_SEAL,CERISE_SEAL,CERISE_SEAL,
	SALMON_COLORED_SEAL,SALMON_COLORED_SEAL,SALMON_COLORED_SEAL,
	PURPLISH_GREY_SEAL, GOLD_COLORED_SEAL, COPPER_COLORED_SEAL,
	BRIGHT_BLUE_SEAL,
	PINE_GREEN_SEAL,PINE_GREEN_SEAL,PINE_GREEN_SEAL,
	AMBER_COLORED_SEAL,AMBER_COLORED_SEAL,AMBER_COLORED_SEAL,
	FALLOW_COLORED_SEAL,TAUPE_COLORED_SEAL,SIENNA_COLORED_SEAL,
	LAVENDER_COLORED_SEAL
		}