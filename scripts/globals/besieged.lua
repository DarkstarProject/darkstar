

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
    local runicPortal = player:getNationTeleport(AHTURHGAN)
    local bit = {}

    for i = 6,1,-1 do
        twop = 2^i

        if (runicPortal >= twop) then
            bit[i]=1; runicPortal = runicPortal - twop;
        else
            bit[i]=0;
        end
    end

    return bit[portal];
end;

-----------------------------------
-- hasAssaultOrders Action
-----------------------------------

function hasAssaultOrders(player)
    local event = 0;
    local keyitem = 0;

    if (player:hasKeyItem(LEUJAOAM_ASSAULT_ORDERS)) then -- assault @ Azouph Isle
        event = 0x0078;
        keyitem = LEUJAOAM_ASSAULT_ORDERS;
    elseif (player:hasKeyItem(MAMOOL_JA_ASSAULT_ORDERS)) then -- assault @ Mamool Ja
        event = 0x0079;
        keyitem = MAMOOL_JA_ASSAULT_ORDERS;
    elseif (player:hasKeyItem(LEBROS_ASSAULT_ORDERS)) then -- assault @ Halvung
        event = 0x007A;
        keyitem = LEBROS_ASSAULT_ORDERS;
    elseif (player:hasKeyItem(PERIQIA_ASSAULT_ORDERS)) then -- assault @ Dvucca Isle
        event = 0x007B;
        keyitem = PERIQIA_ASSAULT_ORDERS;
    elseif (player:hasKeyItem(ILRUSI_ASSAULT_ORDERS)) then -- assault @ Ilrusi Atoll
        event = 0x007C;
        keyitem = ILRUSI_ASSAULT_ORDERS;
    elseif (player:hasKeyItem(NYZUL_ISLE_ASSAULT_ORDERS)) then -- assault @  Nyzul Isle
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
    if (player:hasKeyItem(1862)) then mamook = 1 else mamook = 0 end -- Map of Mammok
    if (player:hasKeyItem(1863)) then halvung = 1 else halvung = 0 end -- Map of Halvung
    if (player:hasKeyItem(1864)) then arrapago = 1 else arrapago = 0 end -- Map of Arrapago Reef
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

function getMercenaryRank(player)
    local rank = 0;
    local badges = { 0x030C, 0x030F, 0x0310, 0x031A, 0x031B, 0x0339, 0x033A, 0x033B, 0x037E, 0x0384, 0x38D }

    while player:hasKeyItem(badges[rank + 1]) == true do
        rank = rank + 1;
    end

    return rank;
end;

function getRecommendedAssaultLevel(assaultid)
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
    end
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
    local duration = 10800 + 1200*1--(getMercenaryRank(player)-1);

    if (getAstralCandescence() == 0) then
        duration = duration / 2;
    end

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

------------------------------------------------------------------------------
-- function getISPItem(i) returns the item ID and cost of the imperial standing
-- points item indexed by i (the same value  as that used by the vendor event.)
-------------------------------------------------------------------------------

function getISPItem(i)
    local IS_item =
    {
        -- Common Items
        [1] = {id = 4182, price = 7}, -- scroll of Instant Reraise
        [4097] = {id = 4181, price = 10}, -- scroll of Instant Warp
        [8193] = {id = 2230, price = 100}, -- lambent fire cell
        [12289] = {id = 2231, price = 100}, -- lambent water cell
        [16385] = {id = 2232, price = 100}, -- lambent earth cell
        [20481] = {id = 2233, price = 100}, -- lambent wind cell
        [24577] = {id = 19021, price = 20000}, -- katana strap
        [28673] = {id = 19022, price = 20000}, -- axe grip
        [32769] = {id = 19023, price = 20000}, -- staff strap
        -- Private First Class
        -- No items in this rank?
        -- Private First Class
        [33] = {id = 18689, price = 18689}, -- volunteer's dart
        [289] = {id = 18690, price = 2000}, -- mercenary's dart
        [545] = {id = 18691, price = 2000}, -- Imperial dart
        -- Superior Private
        [49] = {id = 18692, price = 4000}, -- Mamoolbane
        [305] = {id = 18693, price = 4000}, -- Lamiabane
        [561] = {id = 18694, price = 4000}, -- Trollbane
        [817] = {id = 15810, price = 4000}, -- Luzaf's ring
        -- Lance Corporal
        [65] = {id = 15698, price = 8000}, -- sneaking boots
        [321] = {id = 15560, price = 8000}, -- trooper's ring
        [577] = {id = 16168, price = 8000}, -- sentinel shield
        -- Corporal
        [81] = {id = 18703, price = 16000}, -- shark gun
        [337] = {id = 18742, price = 16000}, -- puppet claws
        [593] = {id = 17723, price = 16000}, -- singh kilij
        -- Sergeant
        [97] = {id = 15622, price = 24000}, -- mercenary's trousers
        [353] = {id = 15790, price = 24000}, -- multiple ring
        [609] = {id = 15981, price = 24000}, -- haten earring
        -- Sergeant Major
        [113] = {id = 15623, price = 32000}, -- volunteer's brais
        [369] = {id = 15982, price = 32000}, -- priest's earring
        [625] = {id = 15983, price = 32000}, -- chaotic earring
        -- Chief Sergeant
        [129] = {id = 17741, price = 40000}, -- perdu hanger
        [385] = {id = 18943, price = 40000}, -- perdu sickle
        [641] = {id = 18850, price = 40000}, -- perdu wand
        [897] = {id = 18717, price = 40000}, -- perdu bow
        -- Second Lieutenant
        [145] = {id = 16602, price = 48000}, -- perdu sword
        [401] = {id = 18425, price = 48000}, -- perdu blade
        [657] = {id = 18491, price = 48000}, -- perdu voulge
        [913] = {id = 18588, price = 48000}, -- perdu staff
        [1169] = {id = 18718, price = 48000}, -- perdu crossbow
        -- First Lieutenant
        [161] = {id = 16271, price = 56000}, -- lieutenant's gorget
        [417] = {id = 15912, price = 56000}, -- lieutenant's sash
        [673] = {id = 16230, price = 56000} -- lieutenant's cape
    }
    local item = IS_item[i];
    return item.id, item.price;
end;
