

-----------------------------------------------------------------
-- Variable for getNationTeleport and getPoint
-----------------------------------------------------------------

ALLIED_NOTES = 11;
MAW = 4;
PAST_SANDORIA = 5;
PAST_BASTOK = 6;
PAST_WINDURST = 7;

-- -------------------------------------------------------------------
-- getMedalRank()
-- Returns the numerical Campaign Medal of the player.
-- -------------------------------------------------------------------

function getMedalRank(player)
    local rank = 0;
    local medals =
    {
         0x039C, 0x039D, 0x039E, 0x039F, 0x03A0, 0x03A1, 0x03A2,
         0x03A3, 0x03A4, 0x03A5, 0x03A6, 0x03A7, 0x03A8, 0x03A9,
         0x03AA, 0x03AB, 0x03AC, 0x03AD, 0x03AE, 0x03AF
    }
    while (player:hasKeyItem(medals[rank + 1]) == true) do
        rank = rank + 1;
    end;
    return rank;
end;

-- -------------------------------------------------------------------
-- get[nation]NotesItem()
-- Returns the item ID and cost of the Allied Notes indexed item
-- (the same value as that used by the vendor event)
-- Format:
-- ListName_AN_item[optionID] = itemID; -- ItemName
-- ListName_AN_price[optionID] = cost; -- ItemName
-- -------------------------------------------------------------------

function getSandOriaNotesItem(i)
    local SandOria_AN =
    {
        [2] = {id = 15754, price = 980}, -- Sprinter's Shoes
        [258] = {id = 5428, price = 10}, -- Scroll of Instant Retrace
        [514] = {id = 14584, price = 1500}, -- Iron Ram jack coat
        [770] = {id = 14587, price = 1500}, -- Pilgrim Tunica
        [1026] = {id = 16172, price = 4500}, -- Iron Ram Shield
        [1282] = {id = 15841, price = 5000}, -- Recall Ring: Jugner
        [1538] = {id = 15842, price = 5000}, -- Recall Ring: Pashow
        [1794] = {id = 15843, price = 5000}, -- Recall Ring: Meriphataud
        [2050] = {id = 10116, price = 2000} -- Cipher: Valaineral
    }
    local item = SandOria_AN[i];
    return item.id, item.price;
end;

function getBastokNotesItem(i)
    local Bastok_AN =
    {
        [2] = {id = 15754, price = 980}, -- Sprinter's Shoes
        [258] = {id = 5428, price = 10}, -- Scroll of Instant Retrace
        -- [514] = {id = ?, price = ?}, --
        -- [770] = {id = ?, price = ?}, --
        -- [1026] = {id = ?, price = ?}, --
        [1282] = {id = 15841, price = 5000}, -- Recall Ring: Jugner
        [1538] = {id = 15842, price = 5000}, -- Recall Ring: Pashow
        [1794] = {id = 15843, price = 5000}, -- Recall Ring: Meriphataud
        [2050] = {id = 10116, price = 2000} -- Cipher: Valaineral
    }
    local item = Bastok_AN[i];
    return item.id, item.price;
end;

function getWindurstNotesItem(i)
    local Windurst_AN =
    {
        [2] = {id = 15754, price = 980}, -- Sprinter's Shoes
        [258] = {id = 5428, price = 10}, -- Scroll of Instant Retrace
        -- [514] = {id = ?, price = ?}, --
        -- [770] = {id = ?, price = ?}, --
        -- [1026] = {id = ?, price = ?}, --
        [1282] = {id = 15841, price = 5000}, -- Recall Ring: Jugner
        [1538] = {id = 15842, price = 5000}, -- Recall Ring: Pashow
        [1794] = {id = 15843, price = 5000}, -- Recall Ring: Meriphataud
        [2050] = {id = 10116, price = 2000} -- Cipher: Valaineral
    }
    local item = Windurst_AN[i];
    return item.id, item.price;
end;

-- -------------------------------------------------------------------
-- getSigilTimeStamp(player)
-- This is for the time-stamp telling player what day/time the
-- effect will last until, NOT the actual status effect duration.
-- -------------------------------------------------------------------

function getSigilTimeStamp(player)
    local timeStamp = 0; -- zero'd till math is done.

    -- TODO: calculate time stamp for menu display of when it wears off

    return timeStamp;
end;

-----------------------------------
-- hasMawActivated Action
-----------------------------------

-- 1st number for hasMawActivated()
-- 2nd number for player:addNationTeleport();

-- 0    1   Batallia Downs (S) (H-5)
-- 1    2   Rolanberry Fields (S) (H-6)
-- 2    4   Sauromugue Champaign (S) (K-9)
-- 3    8   Jugner Forest (S) (H-11)
-- 4    16  Pashhow Marshlands (S) (K-8)
-- 5    32  Meriphataud Mountains (S) (K-6)
-- 6    64  East Ronfaure (S) (H-5)
-- 7    128 North Gustaberg (S) (K-7)
-- 8    256 West Sarutabaruta (S) (H-9)

function hasMawActivated(player,portal)
    local mawActivated = player:getNationTeleport(MAW);
    local bit = {};

    for i = 8,0,-1 do
        twop = 2^i

        if (mawActivated >= twop) then
            bit[i]=true; mawActivated = mawActivated - twop;
        else
            bit[i]=false;
        end
    end;

    return bit[portal];
end;

-- TODO:
-- Past nation teleport