-----------------------------------
--
--     Functions for Conquest system
--
-----------------------------------
require("scripts/globals/teleports")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/settings")
require("scripts/globals/common")
require("scripts/globals/status")
require("scripts/globals/zone")
-----------------------------------

dsp = dsp or {}
dsp.conquest = dsp.conquest or {}

-----------------------------------
-- (LOCAL) constants
-----------------------------------

local CONQUEST_TALLY_START = 0
local CONQUEST_TALLY_END   = 1
local CONQUEST_UPDATE      = 2

-----------------------------------
-- (LOCAL) expeditionary forces
-- TODO: implement this menu
-----------------------------------

local exForceMenuData =
{
    0x20006,ZULK_EF,103,0x000040,20,dsp.ki.ZULKHEIM_EF_INSIGNIA,
    0x20007,NORV_EF,104,0x000080,25,dsp.ki.NORVALLEN_EF_INSIGNIA,
    0x20009,DERF_EF,109,0x000200,25,dsp.ki.DERFLAND_EF_INSIGNIA,
    0x2000B,KOLS_EF,118,0x000800,20,dsp.ki.KOLSHUSHU_EF_INSIGNIA,
    0x2000C,ARAG_EF,119,0x001000,25,dsp.ki.ARAGONEU_EF_INSIGNIA,
    0x2000D,FAUR_EF,111,0x002000,35,dsp.ki.FAUREGANDI_EF_INSIGNIA,
    0x2000E,VALD_EF,112,0x004000,40,dsp.ki.VALDEAUNIA_EF_INSIGNIA,
    0x2000F,QUFI_EF,126,0x008000,25,dsp.ki.QUFIM_EF_INSIGNIA,
    0x20010,LITE_EF,121,0x010000,35,dsp.ki.LITELOR_EF_INSIGNIA,
    0x20011,KUZO_EF,114,0x020000,40,dsp.ki.KUZOTZ_EF_INSIGNIA,
    0x20012,VOLL_EF,113,0x040000,65,dsp.ki.VOLLBOW_EF_INSIGNIA,
    0x20013,ELLO_EF,123,0x080000,35,dsp.ki.ELSHIMO_LOWLANDS_EF_INSIGNIA,
    0x20014,ELUP_EF,124,0x100000,45,dsp.ki.ELSHIMO_UPLANDS_EF_INSIGNIA
}

local function getExForceAvailable(player, guardNation)
    return 0
end

local function getExForceReward(player, guardNation)
    return 0
end

-----------------------------------
-- (LOCAL) outposts
-----------------------------------

local outposts =
{
    [dsp.region.RONFAURE]        = {zone = 100, ki = dsp.ki.RONFAURE_SUPPLIES,              cp = 10, lvl = 10, fee = 100},
    [dsp.region.ZULKHEIM]        = {zone = 103, ki = dsp.ki.ZULKHEIM_SUPPLIES,              cp = 30, lvl = 10, fee = 100},
    [dsp.region.NORVALLEN]       = {zone = 104, ki = dsp.ki.NORVALLEN_SUPPLIES,             cp = 40, lvl = 15, fee = 150},
    [dsp.region.GUSTABERG]       = {zone = 106, ki = dsp.ki.GUSTABERG_SUPPLIES,             cp = 10, lvl = 10, fee = 100},
    [dsp.region.DERFLAND]        = {zone = 109, ki = dsp.ki.DERFLAND_SUPPLIES,              cp = 40, lvl = 15, fee = 150},
    [dsp.region.SARUTABARUTA]    = {zone = 115, ki = dsp.ki.SARUTABARUTA_SUPPLIES,          cp = 10, lvl = 10, fee = 100},
    [dsp.region.KOLSHUSHU]       = {zone = 118, ki = dsp.ki.KOLSHUSHU_SUPPLIES,             cp = 40, lvl = 10, fee = 100},
    [dsp.region.ARAGONEU]        = {zone = 119, ki = dsp.ki.ARAGONEU_SUPPLIES,              cp = 40, lvl = 15, fee = 150},
    [dsp.region.FAUREGANDI]      = {zone = 111, ki = dsp.ki.FAUREGANDI_SUPPLIES,            cp = 70, lvl = 35, fee = 350},
    [dsp.region.VALDEAUNIA]      = {zone = 112, ki = dsp.ki.VALDEAUNIA_SUPPLIES,            cp = 50, lvl = 40, fee = 400},
    [dsp.region.QUFIMISLAND]     = {zone = 126, ki = dsp.ki.QUFIM_SUPPLIES,                 cp = 60, lvl = 15, fee = 150},
    [dsp.region.LITELOR]         = {zone = 121, ki = dsp.ki.LITELOR_SUPPLIES,               cp = 40, lvl = 25, fee = 250},
    [dsp.region.KUZOTZ]          = {zone = 114, ki = dsp.ki.KUZOTZ_SUPPLIES,                cp = 70, lvl = 30, fee = 300},
    [dsp.region.VOLLBOW]         = {zone = 113, ki = dsp.ki.VOLLBOW_SUPPLIES,               cp = 70, lvl = 50, fee = 500},
    [dsp.region.ELSHIMOLOWLANDS] = {zone = 123, ki = dsp.ki.ELSHIMO_LOWLANDS_SUPPLIES,      cp = 70, lvl = 25, fee = 250},
    [dsp.region.ELSHIMOUPLANDS]  = {zone = 124, ki = dsp.ki.ELSHIMO_UPLANDS_SUPPLIES,       cp = 70, lvl = 35, fee = 350},
    [dsp.region.TULIA]           = {zone = 130,                                             cp = 0,  lvl = 70, fee = 500},
    [dsp.region.TAVNAZIANARCH]   = {zone =  24, ki = dsp.ki.TAVNAZIAN_ARCHIPELAGO_SUPPLIES, cp = 70, lvl = 30, fee = 300},
    [dsp.region.MOVALPOLOS]      = {zone =  11,                                             cp = 40, lvl = 25, fee = 250}
}

local function hasOutpost(player, region)
    local regionBit = math.pow(2, region + 5)
    local supplyQuests = player:getNationTeleport(player:getNation())
    return bit.band(supplyQuests, regionBit) == regionBit
end

local function setHomepointFee(player, guardNation)
    local pNation = player:getNation()
    local fee = 0

    if pNation ~= guardNation and not dsp.conquest.areAllies(pNation, guardNation) then
        local rank = player:getRank()
        if rank <= 5 then
            fee = 100 * math.pow(2, rank - 1)
        else
            fee = (800 * rank) - 2400
        end
    end

    return fee
end

local function getRegionsMask(nation)
    local mask = 0
    for region = dsp.region.RONFAURE, dsp.region.TAVNAZIANARCH do
        if GetRegionOwner(region) == nation then
            mask = bit.bor(mask, bit.lshift(1, region + 5)) -- Region bits start at 5th bit
        end
    end

    return mask
end

local function getAllowedTeleports(player, nation)
    local allowedTeleports = 0x3F00001F
    for region = dsp.region.RONFAURE, dsp.region.TAVNAZIANARCH do
        if not dsp.conquest.canTeleportToOutpost(player, region) then
            allowedTeleports = bit.bor(allowedTeleports, bit.lshift(1, region + 5)) -- Region bits start at 5th bit
        end
    end

    return allowedTeleports
end

-----------------------------------
-- (LOCAL) supply runs
-----------------------------------

-- produce supply quest mask for the nation based on current conquest standings
local function suppliesAvailableBitmask(player, nation)
    local mask = 2130706463

    if player:getVar("supplyQuest_started") == vanaDay() then
        mask = 4294967295 -- Need to wait 1 vanadiel day
    end

    for k, v in pairs(outposts) do
        if v.ki and player:hasKeyItem(v.ki) then
            mask = -1
            break
        end
    end

    if mask ~= -1 and mask ~= 4294967295 then
        for i = 0, 18 do
            if GetRegionOwner(i) ~= nation or i == 16 or i == 17 or (i == 18 and not player:hasCompletedMission(COP, DARKNESS_NAMED)) then
                mask = mask + 2^(i + 5)
            end
        end
    end

    return mask
end

local function areSuppliesRotten(player, npc, guardType)
    local fresh   = player:getVar("supplyQuest_fresh")
    local region  = player:getVar("supplyQuest_region")
    local rotten  = false
    local text    = zones[player:getZoneID()].text

    if region > 0 and fresh <= os.time() then
        rotten = true
    end

    if rotten then
        if guardType <= dsp.conquest.guard.FOREIGN then
            player:showText(npc, text.CONQUEST + 40) -- "We will dispose of those unusable supplies."
        else
            player:showText(npc, text.CONQUEST - 1) -- "Hmm... These supplies you have brought us are too old to be of any use."
        end
        local ki = outposts[region].ki

        player:delKeyItem(ki)
        player:messageSpecial(text.KEYITEM_LOST, ki)
        player:setVar("supplyQuest_started", 0)
        player:setVar("supplyQuest_region", 0)
        player:setVar("supplyQuest_fresh", 0)
    end

    return rotten
end

local function canDeliverSupplies(player, guardNation, guardEvent, guardRegion)
    local delivered = false

    local region = player:getVar("supplyQuest_region")
    if region == guardRegion and player:hasKeyItem(outposts[region].ki) then
        delivered = true
        player:startEvent(guardEvent, 16, 0, 0, 0, 1, 0, 0, 255) -- "you have brought us supplies!"
    end

    return delivered
end

-----------------------------------
-- (LOCAL) overseers
-----------------------------------

local overseerOffsets =
{
    [dsp.region.RONFAURE] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Doladepaiton, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Ballie, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- Flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- Flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Yoshihiro, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Molting Moth, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- Flag
        {offset = 13, nation = dsp.nation.BASTOK},   -- Flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Kyanta-Pakyanta, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Tottoto, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- Flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- Flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- Flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- Flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Harvetour
    },
    [dsp.region.ZULKHEIM] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Quanteilleron, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Prunilla, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 12, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Tsunashige, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Fighting Ant, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 13, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Nyata-Mobuta, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Tebubu, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 14, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 15, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Medicine Axe
    },
    [dsp.region.NORVALLEN] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Chaplion, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Taumiale, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Takamoto, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Pure Heart, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Bubchu-Bibinchu, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Geruru, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Mionie
    },
    [dsp.region.GUSTABERG] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Ennigreaud, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Quellebie, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Shigezane, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Heavy Fog, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Kuuwari-Aori, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Butsutsu, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Kuleo
    },
    [dsp.region.DERFLAND] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Mesachedeau, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Ioupie, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Souun, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Sharp Tooth, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Mokto-Lankto, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Shikoko, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Tahmasp
    },
    [dsp.region.SARUTABARUTA] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Naguipeillont, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Banege, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Ryokei, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Slow Axe, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Roshina-Kuleshuna, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Darumomo, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Mahien-Uhien
    },
    [dsp.region.KOLSHUSHU] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Bonbavour, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Craigine, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Ishin, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Wise Turtle, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Ganemu-Punnemu, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Mashasha, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Lobho Ukipturi
    },
    [dsp.region.ARAGONEU] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Chegourt, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Buliame, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Akane, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Three Steps, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Donmo-Boronmo, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Daruru, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Mushosho
    },
    [dsp.region.FAUREGANDI] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Parledaire, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Leaufetie, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Akane, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Rattling Rain, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Ryunchi-Pauchi, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Chopapa, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Gueriette
    },
    [dsp.region.VALDEAUNIA] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Jeantelas, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Pilcha, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Kaya, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Heavy Bear, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Magumo-Yagimo, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Tememe, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Pelogrant
    },
    [dsp.region.QUFIMISLAND] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Pitoire, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Matica, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Sasa, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Singing Blade, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Tsonga-Hoponga, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Numumu, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Jiwon
    },
    [dsp.region.LITELOR] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Credaurion, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Limion, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Calliope, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Dedden, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Ajimo-Majimo, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Ochocho, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Kasim
    },
    [dsp.region.KUZOTZ] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Eaulevisat, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Laimeve, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Lindgard, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Daborn, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Variko-Njariko, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Sahgygy, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Sowande
    },
    [dsp.region.VOLLBOW] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Salimardi, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Paise, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Sarmistha, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Dultwa, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Voranbo-Natanbo, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Orukeke, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Bright Moon
    },
    [dsp.region.ELSHIMOLOWLANDS] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Zorchorevi, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Mupia, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Mahol, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Bammiro, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Uphra-Kophra, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Richacha, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Robino-Mobino
    },
    [dsp.region.ELSHIMOUPLANDS] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Ilieumort, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Emila, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Mintoo, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Guddal, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Etaj-Pohtaj, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Ghantata, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Mugha Dovajaiho
    },
    [dsp.region.TULIA] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- flag
        {offset =  3, nation = dsp.nation.BEASTMEN}, -- flag
    },
    [dsp.region.MOVALPOLOS] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- flag
        {offset =  3, nation = dsp.nation.BEASTMEN}, -- flag
    },
    [dsp.region.TAVNAZIANARCH] =
    {
        {offset =  0, nation = dsp.nation.SANDORIA}, -- Jemmoquel, R.K.
        {offset =  7, nation = dsp.nation.SANDORIA}, -- Chilaumme, R.K.
        {offset =  3, nation = dsp.nation.SANDORIA}, -- flag
        {offset = 11, nation = dsp.nation.SANDORIA}, -- flag
        {offset =  1, nation = dsp.nation.BASTOK},   -- Yoram, I.M.
        {offset =  8, nation = dsp.nation.BASTOK},   -- Ghost Talker, I.M.
        {offset =  4, nation = dsp.nation.BASTOK},   -- flag
        {offset = 12, nation = dsp.nation.BASTOK},   -- flag
        {offset =  2, nation = dsp.nation.WINDURST}, -- Teldo-Moroldo, W.W.
        {offset =  9, nation = dsp.nation.WINDURST}, -- Cotete, W.W.
        {offset =  5, nation = dsp.nation.WINDURST}, -- flag
        {offset = 13, nation = dsp.nation.WINDURST}, -- flag
        {offset =  6, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 14, nation = dsp.nation.BEASTMEN}, -- flag
        {offset = 10, nation = dsp.nation.OTHER},    -- Jersey
    },
}

local crystals =
{
    [4096] = 12,
    [4097] = 12,
    [4098] = 12,
    [4099] = 12,
    [4100] = 12,
    [4101] = 12,
    [4102] = 16,
    [4103] = 16,
    [4238] = 12,
    [4239] = 12,
    [4240] = 12,
    [4241] = 12,
    [4242] = 12,
    [4243] = 12,
    [4244] = 16,
    [4245] = 16,
}

local expRings =
{
    [15761] = {cp=350, charges=7},
    [15762] = {cp=700, charges=7},
    [15763] = {cp=600, charges=3},
}

local function conquestRanking()
    -- computes part of argument 3 for gate guard events. represents the conquest standing of the 3 nations. Verified.
    return getNationRank(dsp.nation.SANDORIA) + 4 * getNationRank(dsp.nation.BASTOK) + 16 * getNationRank(dsp.nation.WINDURST)
end

local function getArg1(player, guardNation, guardType)
    local pNation = player:getNation()
    local output = 0
    local signet = 0

    if guardNation == dsp.nation.WINDURST then
        output = 33
    elseif guardNation == dsp.nation.SANDORIA then
        output = 1
    elseif guardNation == dsp.nation.BASTOK then
        output = 17
    end

    if guardNation == pNation then
        signet = 0
    else
        signet = 7
        if dsp.conquest.areAllies(pNation, guardNation) then
            signet = 2^(2 - pNation)
        end
    end

    if guardNation == dsp.nation.OTHER then
        output = (pNation * 16) + (3 * 256) + 65537
    else
        output = output + 256 * signet
    end

    if guardType >= dsp.conquest.guard.OUTPOST then
        output = output - 1
    end

    if output >= 1792 and guardType >= dsp.conquest.guard.OUTPOST then
        output = 1808
    end

    return output
end

-- arg6 encodes a player's rank and nationality:
-- bits 1-4 encode the rank of the player (verified that bit 4 is part of the rank number so ranks could have gone up to 31.)
-- bits 5-6 seem to encode the citizenship as below. This part needs more testing and verification.

local function getArg6(player)
    return player:getRank() + (player:getNation() * 32)
end

-----------------------------------
-- (LOCAL) overseer stock
-----------------------------------

local overseerInvCommon =
{
    [32928] = {cp =     7, lvl =  1, item =  4182},             -- scroll_of_instant_reraise
    [32929] = {cp =    10, lvl =  1, item =  4181},             -- scroll_of_instant_warp
    [32930] = {cp =  2500, lvl =  1, item = 15542},             -- return_ring
    [32931] = {cp =  9000, lvl =  1, item = 15541},             -- homing_ring
    [32933] = {cp =   500, lvl =  1, item = 15761},             -- chariot_band
    [32934] = {cp =  1000, lvl =  1, item = 15762},             -- empress_band
    [32935] = {cp =  2000, lvl =  1, item = 15763},             -- emperor_band
    [32936] = {cp =  5000, lvl =  1, item = 28540},             -- warp_ring
    [32941] = {cp = 20000, lvl =  1, item =  6380, rank = 10},  -- refined_chair_set
}

local overseerInvNation =
{
    [0] = -- San d'Oria
    {
        [32768] = {rank =  1, cp =  1000, lvl = 10, item = 17167},                -- royal_archers_longbow
        [32769] = {rank =  1, cp =  1000, lvl = 10, item = 16544},                -- royal_archers_sword
        [32770] = {rank =  1, cp =  1000, lvl = 10, item = 12510},                -- royal_footmans_bandana
        [32771] = {rank =  1, cp =  1000, lvl = 10, item = 12753},                -- royal_footmans_gloves
        [32772] = {rank =  1, cp =  1000, lvl = 10, item = 13004},                -- royal_footmans_boots
        [32773] = {rank =  1, cp =  1000, lvl = 10, item = 16691, place = 2},     -- royal_archers_cesti
        [32774] = {rank =  1, cp =  1000, lvl = 10, item = 13718, place = 1},     -- royal_footmans_tunic
        [32784] = {rank =  2, cp =  2000, lvl = 18, item = 16852},                -- royal_spearmans_spear
        [32785] = {rank =  2, cp =  2000, lvl = 10, item = 12630},                -- royal_footmans_vest
        [32786] = {rank =  2, cp =  2000, lvl = 20, item = 12882},                -- royal_footmans_trousers
        [32787] = {rank =  2, cp =  2000, lvl = 20, item = 17367, place = 2},     -- royal_spearmans_horn
        [32788] = {rank =  2, cp =  2000, lvl = 20, item = 13045, place = 1},     -- royal_footmans_clogs
        [32800] = {rank =  3, cp =  4000, lvl = 30, item = 16844},                -- royal_squires_halberd
        [32801] = {rank =  3, cp =  4000, lvl = 30, item = 13104},                -- royal_squires_collar
        [32802] = {rank =  3, cp =  4000, lvl = 30, item = 12431},                -- royal_squires_helm
        [32803] = {rank =  3, cp =  4000, lvl = 30, item = 12687},                -- royal_squires_mufflers
        [32804] = {rank =  3, cp =  4000, lvl = 30, item = 12943},                -- royal_squires_sollerets
        [32805] = {rank =  3, cp =  4000, lvl = 30, item = 16744, place = 2},     -- royal_squires_dagger
        [32806] = {rank =  3, cp =  4000, lvl = 30, item = 17150, place = 1},     -- royal_squires_mace
        [32807] = {rank =  3, cp =  4000, lvl =  1, item = 13495, place = 1},     -- san_dorian_ring
        [32816] = {rank =  4, cp =  8000, lvl = 40, item = 16601},                -- royal_swordsmans_blade
        [32817] = {rank =  4, cp =  8000, lvl = 40, item = 12559},                -- royal_squires_chainmail
        [32818] = {rank =  4, cp =  8000, lvl = 40, item = 12815},                -- royal_squires_breeches
        [32819] = {rank =  4, cp =  8000, lvl = 40, item = 13719, place = 2},     -- royal_squires_robe
        [32820] = {rank =  4, cp =  8000, lvl = 40, item = 12336, place = 1},     -- royal_squires_shield
        [32832] = {rank =  5, cp = 16000, lvl = 50, item = 16851},                -- royal_knight_army_lance
        [32833] = {rank =  5, cp = 16000, lvl = 50, item = 16571},                -- temple_knight_army_sword
        [32834] = {rank =  5, cp = 16000, lvl = 50, item = 12312},                -- royal_knight_army_shield
        [32835] = {rank =  5, cp = 16000, lvl = 50, item = 12313},                -- temple_knight_army_shield
        [32836] = {rank =  5, cp = 16000, lvl = 50, item = 13107},                -- royal_knight_army_collar
        [32837] = {rank =  5, cp = 16000, lvl = 50, item = 13105},                -- temple_knight_army_collar
        [32838] = {rank =  5, cp = 16000, lvl = 50, item = 12686},                -- royal_knights_mufflers
        [32839] = {rank =  5, cp = 16000, lvl = 50, item = 12942},                -- royal_knights_sollerets
        [32840] = {rank =  5, cp = 16000, lvl = 50, item = 13220, place = 2},     -- royal_knights_belt
        [32841] = {rank =  5, cp = 16000, lvl = 50, item = 13720, place = 1},     -- royal_knights_cloak
        [32848] = {rank =  6, cp = 24000, lvl = 55, item = 13580},                -- royal_army_mantle
        [32849] = {rank =  6, cp = 24000, lvl = 55, item = 13106},                -- royal_guards_collar
        [32850] = {rank =  6, cp = 24000, lvl = 55, item = 12430},                -- royal_knights_bascinet
        [32851] = {rank =  6, cp = 24000, lvl = 55, item = 13722},                -- royal_knights_aketon
        [32852] = {rank =  6, cp = 24000, lvl = 55, item = 12558, place = 1},     -- royal_knights_chainmail
        [32853] = {rank =  6, cp = 24000, lvl = 55, item = 12814, place = 1},     -- royal_knights_breeches
        [32854] = {rank =  6, cp = 24000, lvl = 55, item = 12321, place = 2},     -- royal_guards_shield
        [32855] = {rank =  6, cp = 24000, lvl = 55, item = 17067, place = 1},     -- royal_guards_rod
        [32856] = {rank =  6, cp = 24000, lvl = 55, item = 16599, place = 1},     -- royal_guards_sword
        [32857] = {rank =  6, cp = 24000, lvl = 55, item = 16805, place = 1},     -- royal_guards_fleuret
        [32864] = {rank =  7, cp = 32000, lvl = 60, item = 18738},                -- temple_knights_arrow
        [32865] = {rank =  7, cp = 32000, lvl = 60, item = 16886, place = 2},     -- grand_knights_lance
        [32866] = {rank =  7, cp = 32000, lvl = 60, item = 13557, place = 1},     -- grand_knights_ring
        [32880] = {rank =  8, cp = 40000, lvl = 65, item = 14013},                -- grand_temple_knights_gauntlets
        [32881] = {rank =  8, cp = 40000, lvl = 65, item = 14014, place = 2},     -- grand_temple_knights_bangles
        [32882] = {rank =  8, cp = 40000, lvl = 65, item = 13140, place = 1},     -- grand_temple_knights_collar
        [32896] = {rank =  9, cp = 48000, lvl = 71, item = 16953},                -- reserve_captains_greatsword
        [32897] = {rank =  9, cp = 48000, lvl = 71, item = 17934},                -- reserve_captains_pick
        [32898] = {rank =  9, cp = 48000, lvl = 71, item = 17458, place = 2},     -- reserve_captains_mace
        [32899] = {rank =  9, cp = 48000, lvl = 71, item = 16893, place = 1},     -- reserve_captains_lance
        [32912] = {rank = 10, cp = 56000, lvl =  1, item = 14428, place = 1},     -- kingdom_aketon
        [32932] = {           cp =  5000, lvl =  1, item = 17583},                -- kingdom_signet_staff
        [32940] = {rank = 10, cp = 10000, lvl =  1, item =  6377},                -- imperial_chair_set
    },
    [1] = -- Bastok
    {
        [32768] = {rank =  1, cp =  1000, lvl = 10, item = 16433},                -- legionnaires_knuckles
        [32769] = {rank =  1, cp =  1000, lvl = 10, item = 17223},                -- legionnaires_crossbow
        [32770] = {rank =  1, cp =  1000, lvl = 10, item = 16648},                -- legionnaires_axe
        [32771] = {rank =  1, cp =  1000, lvl = 10, item = 12509},                -- legionnaires_cap
        [32772] = {rank =  1, cp =  1000, lvl = 10, item = 12752},                -- legionnaires_mittens
        [32773] = {rank =  1, cp =  1000, lvl = 10, item = 13003},                -- legionnaires_leggings
        [32774] = {rank =  1, cp =  1000, lvl = 10, item = 17128, place = 2},     -- legionnaires_staff
        [32775] = {rank =  1, cp =  1000, lvl = 10, item = 16780, place = 1},     -- legionnaires_scythe
        [32784] = {rank =  2, cp =  2000, lvl = 18, item = 17048},                -- decurions_hammer
        [32785] = {rank =  2, cp =  2000, lvl = 10, item = 12629},                -- legionnaires_harness
        [32786] = {rank =  2, cp =  2000, lvl = 20, item = 12881},                -- legionnaires_subligar
        [32787] = {rank =  2, cp =  2000, lvl = 20, item = 16745, place = 2},     -- decurions_dagger
        [32788] = {rank =  2, cp =  2000, lvl = 20, item = 12337, place = 1},     -- decurions_shield
        [32800] = {rank =  3, cp =  4000, lvl = 30, item = 16712},                -- centurions_axe
        [32801] = {rank =  3, cp =  4000, lvl = 10, item = 13098},                -- republican_bronze_medal
        [32802] = {rank =  3, cp =  4000, lvl = 30, item = 12438},                -- centurions_visor
        [32803] = {rank =  3, cp =  4000, lvl = 30, item = 12566},                -- centurions_scale_mail
        [32804] = {rank =  3, cp =  4000, lvl = 30, item = 12694},                -- centurions_finger_gauntlets
        [32805] = {rank =  3, cp =  4000, lvl = 30, item = 12822},                -- centurions_cuisses
        [32806] = {rank =  3, cp =  4000, lvl = 30, item = 12950},                -- centurions_greaves
        [32807] = {rank =  3, cp =  4000, lvl = 30, item = 16806, place = 2},     -- centurions_sword
        [32808] = {rank =  3, cp =  4000, lvl = 30, item = 13830, place = 1},     -- legionnaires_circlet
        [32809] = {rank =  3, cp =  4000, lvl =  1, item = 13497, place = 1},     -- bastokan_ring
        [32816] = {rank =  4, cp =  8000, lvl = 40, item = 16516},                -- junior_musketeers_tuck
        [32817] = {rank =  4, cp =  8000, lvl = 40, item = 12422},                -- iron_musketeers_armet
        [32818] = {rank =  4, cp =  8000, lvl = 40, item = 12678},                -- iron_musketeers_gauntlets
        [32819] = {rank =  4, cp =  8000, lvl = 40, item = 12934},                -- iron_musketeers_sabatons
        [32820] = {rank =  4, cp =  8000, lvl = 40, item = 13721, place = 2},     -- iron_musketeers_gambison
        [32821] = {rank =  4, cp =  8000, lvl = 40, item = 17283, place = 1},     -- junior_musketeers_chakram
        [32832] = {rank =  5, cp = 16000, lvl = 50, item = 16529},                -- musketeers_sword
        [32833] = {rank =  5, cp = 16000, lvl = 30, item = 13099},                -- republican_iron_medal
        [32834] = {rank =  5, cp = 16000, lvl = 50, item = 12550},                -- iron_musketeers_cuirass
        [32835] = {rank =  5, cp = 16000, lvl = 50, item = 12806},                -- iron_musketeers_cuisses
        [32836] = {rank =  5, cp = 16000, lvl = 50, item = 17129, place = 2},     -- musketeers_pole
        [32837] = {rank =  5, cp = 16000, lvl = 50, item = 17253, place = 1},     -- musketeer_gun
        [32848] = {rank =  6, cp = 24000, lvl = 55, item = 13100},                -- republican_mythril_medal
        [32849] = {rank =  6, cp = 24000, lvl = 55, item = 13582},                -- republican_army_mantle
        [32850] = {rank =  6, cp = 24000, lvl = 55, item = 16557, place = 2},     -- musketeer_commanders_falchion
        [32851] = {rank =  6, cp = 24000, lvl = 55, item = 12304, place = 2},     -- musketeer_commanders_shield
        [32852] = {rank =  6, cp = 24000, lvl = 55, item = 17151, place = 1},     -- musketeer_commanders_rod
        [32853] = {rank =  6, cp = 24000, lvl = 55, item = 13064, place = 1},     -- iron_musketeers_gorget
        [32864] = {rank =  7, cp = 32000, lvl = 60, item = 15957},                -- iron_musketeers_quiver
        [32865] = {rank =  7, cp = 32000, lvl = 60, item = 17807, place = 2},     -- gold_musketeers_uchigatana
        [32866] = {rank =  7, cp = 32000, lvl = 60, item = 13558, place = 1},     -- gold_musketeers_ring
        [32880] = {rank =  8, cp = 40000, lvl = 65, item = 14015},                -- praefectuss_gloves
        [32881] = {rank =  8, cp = 40000, lvl = 65, item = 13880, place = 2},     -- presidential_hairpin
        [32882] = {rank =  8, cp = 40000, lvl = 65, item = 13141, place = 1},     -- republican_gold_medal
        [32896] = {rank =  9, cp = 48000, lvl = 71, item = 16799},                -- senior_gold_musketeers_scythe
        [32897] = {rank =  9, cp = 48000, lvl = 71, item = 17457},                -- senior_gold_musketeers_rod
        [32898] = {rank =  9, cp = 48000, lvl = 71, item = 18196, place = 2},     -- senior_gold_musketeers_axe
        [32899] = {rank =  9, cp = 48000, lvl = 71, item = 17655, place = 1},     -- senior_gold_musketeers_scimitar
        [32912] = {rank = 10, cp = 56000, lvl =  1, item = 14429, place = 1},     -- republic_aketon
        [32932] = {           cp =  5000, lvl =  1, item = 17584},                -- republic_signet_staff
        [32940] = {rank = 10, cp = 10000, lvl =  1, item =  6378},                -- decorative_chair_set
    },
    [2] = -- Windurst
    {
        [32768] = {rank =  1, cp =  1000, lvl = 10, item = 17159},                -- freeswords_bow
        [32769] = {rank =  1, cp =  1000, lvl = 10, item = 17028},                -- freeswords_club
        [32770] = {rank =  1, cp =  1000, lvl = 10, item = 16442},                -- freeswords_baghnakhs
        [32771] = {rank =  1, cp =  1000, lvl = 10, item = 12915, place = 2},     -- freeswords_slops
        [32772] = {rank =  1, cp =  1000, lvl = 10, item = 17130, place = 1},     -- freeswords_staff
        [32784] = {rank =  2, cp =  2000, lvl = 18, item = 17103},                -- mercenarys_pole
        [32785] = {rank =  2, cp =  2000, lvl = 20, item = 12484},                -- mercenarys_hachimaki
        [32786] = {rank =  2, cp =  2000, lvl = 20, item = 12653},                -- mercenarys_gi
        [32787] = {rank =  2, cp =  2000, lvl = 20, item = 12719},                -- mercenarys_tekko
        [32788] = {rank =  2, cp =  2000, lvl = 20, item = 12855},                -- mercenarys_sitabaki
        [32789] = {rank =  2, cp =  2000, lvl = 20, item = 12975},                -- mercenarys_kyahan
        [32790] = {rank =  2, cp =  2000, lvl = 20, item = 16746, place = 2},     -- mercenarys_knife
        [32791] = {rank =  2, cp =  2000, lvl = 20, item = 16930, place = 1},     -- mercenarys_greatsword
        [32800] = {rank =  3, cp =  4000, lvl = 30, item = 16776},                -- mercenary_captains_scythe
        [32801] = {rank =  3, cp =  4000, lvl = 30, item = 12470},                -- mercenary_captains_headgear
        [32802] = {rank =  3, cp =  4000, lvl = 30, item = 12598},                -- mercenary_captains_doublet
        [32803] = {rank =  3, cp =  4000, lvl = 30, item = 12726},                -- mercenary_captains_gloves
        [32804] = {rank =  3, cp =  4000, lvl = 30, item = 12854},                -- mercenary_captains_hose
        [32805] = {rank =  3, cp =  4000, lvl = 30, item = 12982},                -- mercenary_captains_gaiters
        [32806] = {rank =  3, cp =  4000, lvl = 30, item = 16747, place = 2},     -- mercenary_captains_kukri
        [32807] = {rank =  3, cp =  4000, lvl = 30, item = 13221, place = 1},     -- mercenary_captains_belt
        [32808] = {rank =  3, cp =  4000, lvl =  1, item = 13496, place = 1},     -- windurstian_ring
        [32816] = {rank =  4, cp =  8000, lvl = 40, item = 16463},                -- combat_casters_dagger
        [32817] = {rank =  4, cp =  8000, lvl = 40, item = 17282},                -- combat_casters_boomerang
        [32818] = {rank =  4, cp =  8000, lvl = 10, item = 13101},                -- green_scarf
        [32819] = {rank =  4, cp =  8000, lvl = 40, item = 12614},                -- combat_casters_cloak
        [32820] = {rank =  4, cp =  8000, lvl = 40, item = 12743},                -- combat_casters_mitts
        [32821] = {rank =  4, cp =  8000, lvl = 40, item = 12870},                -- combat_casters_slacks
        [32822] = {rank =  4, cp =  8000, lvl = 40, item = 12998},                -- combat_casters_shoes
        [32823] = {rank =  4, cp =  8000, lvl = 40, item = 16807, place = 2},     -- combat_casters_scimitar
        [32824] = {rank =  4, cp =  8000, lvl = 40, item = 16669, place = 1},     -- combat_casters_axe
        [32832] = {rank =  5, cp = 16000, lvl = 50, item = 17082, place = 2},     -- tactician_magicians_wand
        [32833] = {rank =  5, cp = 16000, lvl = 30, item = 13102},                -- paisley_scarf
        [32834] = {rank =  5, cp = 16000, lvl = 50, item = 12478, place = 2},     -- tactician_magicians_hat
        [32835] = {rank =  5, cp = 16000, lvl = 50, item = 12606},                -- tactician_magicians_coat
        [32836] = {rank =  5, cp = 16000, lvl = 50, item = 12734},                -- tactician_magicians_cuffs
        [32837] = {rank =  5, cp = 16000, lvl = 50, item = 12862},                -- tactician_magicians_slops
        [32838] = {rank =  5, cp = 16000, lvl = 50, item = 12990},                -- tactician_magicians_pigaches
        [32839] = {rank =  5, cp = 16000, lvl = 50, item = 16810},                -- tactician_magicians_espadon
        [32840] = {rank =  5, cp = 16000, lvl = 50, item = 16694, place = 1},     -- tactician_magicians_hooks
        [32848] = {rank =  6, cp = 24000, lvl = 55, item = 13103},                -- checkered_scarf
        [32849] = {rank =  6, cp = 24000, lvl = 55, item = 13581},                -- federal_army_mantle
        [32850] = {rank =  6, cp = 24000, lvl = 55, item = 17094, place = 2},     -- wise_wizards_staff
        [32851] = {rank =  6, cp = 24000, lvl = 55, item = 16808, place = 2},     -- wise_wizards_bilbo
        [32852] = {rank =  6, cp = 24000, lvl = 55, item = 16809, place = 1},     -- wise_wizards_anelace
        [32864] = {rank =  7, cp = 32000, lvl = 60, item = 15958, place = 3},     -- combat_casters_quiver
        [32865] = {rank =  7, cp = 32000, lvl = 60, item = 12363, place = 2},     -- patriarch_protectors_shield
        [32866] = {rank =  7, cp = 32000, lvl = 60, item = 13559, place = 1},     -- patriarch_protectors_ring
        [32880] = {rank =  8, cp = 40000, lvl = 65, item = 14016},                -- master_casters_mitts
        [32881] = {rank =  8, cp = 40000, lvl = 65, item = 14017, place = 2},     -- master_casters_bracelets
        [32882] = {rank =  8, cp = 40000, lvl = 65, item = 13142, place = 1},     -- windurstian_scarf
        [32896] = {rank =  9, cp = 48000, lvl = 71, item = 18145},                -- master_casters_bow
        [32897] = {rank =  9, cp = 48000, lvl = 71, item = 17530},                -- master_casters_pole
        [32898] = {rank =  9, cp = 48000, lvl = 71, item = 17508, place = 2},     -- master_casters_baghnakhs
        [32899] = {rank =  9, cp = 48000, lvl = 71, item = 17617, place = 1},     -- master_casters_knife
        [32912] = {rank = 10, cp = 56000, lvl =  1, item = 14430, place = 1},     -- federation_aketon
        [32932] = {           cp =  5000, lvl =  1, item = 17585},                -- federation_signet_staff
        [32940] = {rank = 10, cp = 10000, lvl =  1, item =  6379},                -- ornate_stool_set
    },
}

local function getStock(player, guardNation, option)
    local r = overseerInvCommon[option]
    if r == nil then
        if guardNation == dsp.nation.OTHER then
            r = overseerInvNation[player:getNation()][option]
        else
            r = overseerInvNation[guardNation][option]
        end
    end
    return r
end

local function canBuyExpRing(player, item)
    local text = zones[player:getZoneID()].text

    -- check exp ring count
    if ALLOW_MULTIPLE_EXP_RINGS ~= 1 then
        for i = 15761, 15763 do
            if player:hasItem(i) then
                player:messageSpecial(text.ITEM_CANNOT_BE_OBTAINED, item)
                return false
            end
        end
    end

    -- one exp ring per conquest tally
    if BYPASS_EXP_RING_ONE_PER_WEEK ~= 1 and player:getVar("CONQUEST_RING_TIMER") > os.time() then
        player:messageSpecial(text.CONQUEST + 60, 0, 0, item)
        return false
    end

    return true
end

-----------------------------------
-- (PUBLIC) conquest
-----------------------------------

dsp.conquest.guard =
{
    CITY    = 1,
    FOREIGN = 2,
    OUTPOST = 3,
    BORDER  = 4,
}

dsp.conquest.areAllies = function(nationA, nationB)
    return isConquestAlliance() and getNationRank(nationA) > 1 and getNationRank(nationB) > 1
end

dsp.conquest.outpostFee = function(player, region)
    if not hasOutpost(player, region) then
        return 0
    end

    local fee = outposts[region].fee
    if GetRegionOwner(region) == player:getNation() then
        return fee
    else
        return fee * 3
    end
end

dsp.conquest.canTeleportToOutpost = function(player, region)
    local outpost = outposts[region]
    if
        outpost == nil or
        player:getMainLvl() < outpost.lvl or
        not hasOutpost(player, region)
    then
        return false
    end
    return true
end

dsp.conquest.setRegionalConquestOverseers = function(region)
    local zone = outposts[region].zone

    if zone then
        local base = zones[zone].npc.OVERSEER_BASE
        local npcs = overseerOffsets[region]

        if base and npcs then

            -- update the npcs
            local owner = GetRegionOwner(region)
            for _, v in pairs(npcs) do
                local npc = GetNPCByID(base + v.offset)

                if npc then
                    if v.nation == owner then
                        npc:setStatus(dsp.status.NORMAL)
                    else
                        npc:setStatus(dsp.status.DISAPPEAR)
                    end

                    if v.nation == dsp.nation.OTHER then
                        if owner ~= dsp.nation.BEASTMEN then
                            npc:setStatus(dsp.status.NORMAL)
                        else
                            npc:setStatus(dsp.status.DISAPPEAR)
                        end
                    end
                end
            end
        end
    end
end

-----------------------------------
-- (PUBLIC) overseer
-----------------------------------

dsp.conquest.overseerOnTrade = function(player, npc, trade, guardNation, guardType)
    if player:getNation() == guardNation or guardNation == dsp.nation.OTHER then
        local item = trade:getItemId()
        local tradeConfirmed = false
        local mOffset = zones[player:getZoneID()].text.CONQUEST

        -- DONATE CRYSTALS FOR RANK OR CONQUEST POINTS
        if guardType <= dsp.conquest.guard.FOREIGN and crystals[item] then
            local pRank = player:getRank()
            local pRankPoints = player:getRankPoints()
            local addPoints = 0

            for crystalId, crystalWorth in pairs(crystals) do
                local count = trade:getItemQty(crystalId)

                if count > 0 then
                    if pRank == 1 then
                        player:showText(npc, mOffset - 7) -- "I cannot accept crystals from someone whose rank is still 1."
                        break
                    elseif pRankPoints == 4000 then
                        player:showText(npc, mOffset + 43) -- "You do not need to donate any more crystals at your current rank."
                        break
                    else
                        trade:confirmItem(crystalId, count)
                        addPoints = addPoints + count * math.floor(4000 / (player:getRank() * 12 - crystalWorth))
                    end
                end
            end

            if addPoints > 0 and pRank ~= 1 and pRankPoints < 4000 then
                if pRankPoints + addPoints >= 4000 then
                    player:setRankPoints(4000)
                    player:addCP(pRankPoints + addPoints - 4000)
                    player:showText(npc, mOffset + 44) -- "Your rank points are full. We've added the excess to your conquest points."
                else
                    player:addRankPoints(addPoints)
                    player:showText(npc, mOffset + 45) -- "We've awarded you rank points for the crystals you've donated."
                end
                player:confirmTrade()
                tradeConfirmed = true
            end
        end

        -- RECHARGE EXP RING
        if not tradeConfirmed and expRings[item] and npcUtil.tradeHas(trade, item) then
            if BYPASS_EXP_RING_ONE_PER_WEEK == 1 or player:getVar("CONQUEST_RING_RECHARGE") < os.time() then
                local ring = expRings[item]

                if player:getCP() >= ring.cp then
                    player:delCP(ring.cp)
                    player:confirmTrade()
                    player:addItem(item)
                    player:setVar("CONQUEST_RING_RECHARGE", getConquestTally())
                    player:showText(npc, mOffset + 58, item, ring.cp, ring.charges) -- "Your ring is now fully recharged."
                else
                    player:showText(npc, mOffset + 55, item, ring.cp) -- "You do not have the required conquest points to recharge."
                end
             else
                -- TODO: Verify that message is retail correct.
                -- This gives feedback on a failure at least, and is grouped with the recharge messages.  Confident enough for a commit.
                player:showText(npc, mOffset + 56, item) -- "Please be aware that you can only purchase or recharge <item> once during the period between each conquest results tally.
            end
        end
    end
end

dsp.conquest.overseerOnTrigger = function(player, npc, guardNation, guardType, guardEvent, guardRegion)
    local pNation = player:getNation()

    -- SUPPLY RUNS
    if pNation == guardNation and areSuppliesRotten(player, npc, guardType) then
        -- do nothing else
    elseif pNation == guardNation and guardType >= dsp.conquest.guard.OUTPOST and canDeliverSupplies(player, guardNation, guardEvent, guardRegion) then
        -- do nothing else

    -- JEUNO OVERSEERS
    elseif guardType == dsp.conquest.guard.CITY and guardNation == dsp.nation.OTHER then
        local a1 = getArg1(player, guardNation, guardType)
        local a3 = conquestRanking()
        local a6 = getArg6(player)
        local a7 = player:getCP()

        player:startEvent(guardEvent, a1, 0, a3, 0, 0, a6, a7, 0)

    -- CITY AND FOREIGN OVERSEERS
    elseif guardType <= dsp.conquest.guard.FOREIGN then
        local a1 = getArg1(player, guardNation, guardType)
        local a2 = getExForceAvailable(player, guardNation)
        local a3 = conquestRanking()
        local a4 = suppliesAvailableBitmask(player, guardNation)
        local a5 = player:getNationTeleport(guardNation)
        local a6 = getArg6(player)
        local a7 = player:getCP()
        local a8 = getExForceReward(player, guardNation)

        player:startEvent(guardEvent, a1, a2, a3, a4, a5, a6, a7, a8)

    -- OUTPOST AND BORDER OVERSEERS
    elseif guardType >= dsp.conquest.guard.OUTPOST then
        local a1 = getArg1(player, guardNation, guardType)
        if a1 == 1808 then -- non-allied nation
            player:startEvent(guardEvent, a1, 0, 0, 0, 0, player:getRank(), 0, 0)
        else
            player:startEvent(guardEvent, a1, 0, 0x3F0000, 0, 0, getArg6(player), 0, 0)
        end
    end
end

dsp.conquest.overseerOnEventUpdate = function(player, csid, option, guardNation)
    local stock = getStock(player, guardNation, option)

    if stock ~= nil then
        local pNation = player:getNation()
        local pRank   = getNationRank(pNation)
        local u1 = 2 -- default: player is correct job and level to equip item
        local u2 = 0 -- default: player has enough CP for item
        local u3 = stock.item -- default: the item ID we're purchasing

        if false then -- TODO: if player is a job that cannot equip selected item, set u1 to 0 here
            u1 = 0
        elseif stock.lvl > player:getMainLvl() then
            u1 = 1
        end

        if stock.cp > player:getCP() then
            u2 = 1
        end

        local rankCheck = true
        if guardNation ~= dsp.nation.OTHER and guardNation ~= pNation and getNationRank(guardNation) <= pRank then -- buy from other nation, must be higher ranked
            rankCheck = false
        elseif guardNation ~= dsp.nation.OTHER and stock.place ~= nil and guardNation ~= pNation then -- buy from other nation, cannot buy items with nation rank requirement
            rankCheck = false
        elseif stock.place ~= nil and pRank > stock.place then -- buy from own nation, check nation rank
            rankCheck = false
        end

        if rankCheck and u2 == 0 then
            player:setLocalVar("boughtItemCP", stock.item) -- set localVar for later cheat prevention
        end

        player:updateEvent(u1, u2, u3)
    end
end

dsp.conquest.overseerOnEventFinish = function(player, csid, option, guardNation, guardType, guardRegion)
    local pNation  = player:getNation()
    local pRank    = player:getRank()
    local sRegion  = player:getVar("supplyQuest_region")
    local sOutpost = outposts[sRegion]
    local mOffset  = zones[player:getZoneID()].text.CONQUEST

    -- SIGNET
    if option == 1 then
        local duration = (pRank + getNationRank(pNation) + 3) * 3600
        player:delStatusEffectsByFlag(dsp.effectFlag.INFLUENCE, true)
        player:addStatusEffect(dsp.effect.SIGNET, 0, 0, duration)

    -- BEGIN SUPPLY RUN
    elseif option >= 65541 and option <= 65565 and guardType <= dsp.conquest.guard.FOREIGN then
        local region = option - 65541
        local outpost = outposts[region]
        if outpost ~= nil then
            npcUtil.giveKeyItem(player, outpost.ki)
            player:setVar("supplyQuest_started", vanaDay())
            player:setVar("supplyQuest_region", region)
            player:setVar("supplyQuest_fresh", getConquestTally())
        end

    -- FINISH SUPPLY RUN
    elseif
        option == 2 and
        guardType >= dsp.conquest.guard.OUTPOST and
        sRegion == guardRegion and
        sOutpost ~= nil and
        player:hasKeyItem(sOutpost.ki) and
        guardNation == pNation and
        not hasOutpost(player, sRegion)
    then
        player:delKeyItem(sOutpost.ki)
        player:addCP(sOutpost.cp)
        player:messageSpecial(mOffset) -- "You've earned conquest points!"
        player:addNationTeleport(guardNation, math.pow(2, sRegion + 5))
        player:setVar("supplyQuest_started", 0)
        player:setVar("supplyQuest_region", 0)
        player:setVar("supplyQuest_fresh", 0)

    -- SET HOMEPOINT
    elseif option == 4 then
        if player:delGil(setHomepointFee(player, guardNation)) then
            player:setHomePoint()
            player:messageSpecial(mOffset + 94) -- "Your home point has been set."
        else
            player:messageSpecial(mOffset + 95) -- "You do not have enough gil to set your home point here."
        end

    -- PURCHASE CP ITEM
    elseif option >= 32768 and option <= 32944 then
        -- validate stock
        local stock = getStock(player, guardNation, option)
        if stock == nil then
            return
        end

        -- validate localVar (cheat protection)
        local boughtItem = player:getLocalVar("boughtItemCP")
        player:setLocalVar("boughtItemCP", 0)
        if stock.item ~= boughtItem then
            player:messageSpecial(mOffset + 61, stock.item) -- "Your rank is too low to purchase the <item>."
            return
        end

        -- validate rank
        if stock.rank and pRank < stock.rank then
            player:messageSpecial(mOffset + 61, stock.item) -- "Your rank is too low to purchase the <item>."
            return
        end

        -- validate price
        local price = stock.cp
        if stock.rank ~= nil and player:getNation() ~= guardNation and guardNation ~= dsp.nation.OTHER then
            if price <= 8000 then
                price = price * 2
            else
                price = price + 8000
            end
        end
        if player:getCP() < price then
            player:messageSpecial(mOffset + 62, 0, 0, stock.item) -- "You do not have enough conquest points to purchase the <item>."
            return
        end

        -- validate exp rings
        if option >= 32933 and option <= 32935 and not canBuyExpRing(player, stock.item) then
            return
        end

        -- make sale
        if npcUtil.giveItem(player, stock.item) then
            player:delCP(price)
            if option >= 32933 and option <= 32935 then
                player:setVar("CONQUEST_RING_TIMER", getConquestTally())
            end
        end
    end
end

-----------------------------------
-- (PUBLIC) vendor
-----------------------------------

dsp.conquest.vendorOnTrigger = function(player, vendorRegion, vendorEvent)
    local pNation = player:getNation()
    local owner = GetRegionOwner(vendorRegion)

    local nation = 0
    if owner == pNation then
        nation = 1
    elseif dsp.conquest.areAllies(pNation, owner) then
        nation = 2
    end

    local fee = dsp.conquest.outpostFee(player, vendorRegion)
    player:startEvent(vendorEvent,nation,fee,0,fee,player:getCP(),0,0,0)
end

dsp.conquest.vendorOnEventUpdate = function(player, vendorRegion)
    local fee = dsp.conquest.outpostFee(player, vendorRegion)
    player:updateEvent(player:getGil(),fee,0,fee,player:getCP())
end

dsp.conquest.vendorOnEventFinish = function(player, option, vendorRegion)
    local fee = dsp.conquest.outpostFee(player, vendorRegion)

    if option == 1 then
        dsp.shop.outpost(player)
    elseif option == 2 then
        if player:delGil(fee) then
            player:addStatusEffectEx(dsp.effect.TELEPORT, 0, dsp.teleport.id.HOME_NATION, 0, 1, 0, region)
        end
    elseif option == 6 then
        player:delCP(fee)
        player:addStatusEffectEx(dsp.effect.TELEPORT, 0, dsp.teleport.id.HOME_NATION, 0, 1, 0, region)
    end
end

-----------------------------------
-- (PUBLIC) outpost teleport NPC
-----------------------------------

dsp.conquest.teleporterOnTrigger = function(player, teleporterNation, teleporterEvent)
    if player:getNation() == teleporterNation then
        local sandyRegions = getRegionsMask(dsp.nation.SANDORIA)
        local bastokRegions = getRegionsMask(dsp.nation.BASTOK)
        local windyRegions = getRegionsMask(dsp.nation.WINDURST)
        local beastmenRegions = getRegionsMask(dsp.nation.BEASTMEN)

        local allowedTeleports = getAllowedTeleports(player, teleporterNation)

        local teleporterRegion = dsp.region.SANDORIA + teleporterNation

        player:startEvent(teleporterEvent, sandyRegions, bastokRegions, windyRegions, beastmenRegions, bit.lshift(1, teleporterRegion), 0, player:getMainLvl(), allowedTeleports)
    else
        local a6 =
        {
            [dsp.nation.SANDORIA] = 1,
            [dsp.nation.BASTOK]   = 256,
            [dsp.nation.WINDURST] = 512,
        }
        player:startEvent(teleporterEvent, 0, 0, 0, 0, 0, a6[teleporterNation], 0, 0)
    end
end

dsp.conquest.teleporterOnEventUpdate = function(player, csid, option, teleporterEvent)
    if csid == teleporterEvent then
        local region = option - 1073741829
        local fee = dsp.conquest.outpostFee(player, region)
        player:updateEvent(player:getGil(), fee, 0, fee, player:getCP())
    end
end

dsp.conquest.teleporterOnEventFinish = function(player, csid, option, teleporterEvent)
    if csid == teleporterEvent then
        -- TELEPORT WITH GIL
        if option >= 5 and option <= 23 then
            local region = option - 5
            local fee = dsp.conq.outpostFee(player, region)

            if dsp.conquest.canTeleportToOutpost(player, region) and player:delGil(fee) then
                player:addStatusEffectEx(dsp.effect.TELEPORT, 0, dsp.teleport.id.OUTPOST, 0, 1, 0, region)
            end

        -- TELEPORT WITH CP
        elseif option >= 1029 and option <= 1047 then
            local region = option - 1029
            local fee = dsp.conq.outpostFee(player, region)

            if dsp.conquest.canTeleportToOutpost(player, region) and player:getCP() >= fee then
                player:delCP(fee)
                player:addStatusEffectEx(dsp.effect.TELEPORT, 0, dsp.teleport.id.OUTPOST, 0, 1, 0, region)
            end
        end
    end
end

-----------------------------------
-- (PUBLIC) conquest messages
-----------------------------------

dsp.conquest.onConquestUpdate = function(zone, updatetype)
    local region = zone:getRegionID()
    local owner = GetRegionOwner(region)
    local players = zone:getPlayers()
    local messageBase = zones[zone:getID()].text.CONQUEST_BASE
    local ranking = getConquestBalance()

    for _, player in pairs(players) do

        -- CONQUEST TALLY START
        if updatetype == CONQUEST_TALLY_START then
            player:messageText(player, messageBase, 5)

        -- CONQUEST TALLY END
        elseif updatetype == CONQUEST_TALLY_END then
            player:messageText(player, messageBase + 1, 5) -- Tallying conquest results...

            if owner <= 3 then
                player:messageText(player, messageBase + 2 + owner, 5) -- This region is currently under {NATION} control.
            else
                player:messageText(player, messageBase + 6, 5) -- This region is currently under beastman control.
            end

            local offset = 0
            if bit.band(ranking, 0x03) == 0x01 then
                offset = offset + 7 -- 7
                if bit.band(ranking, 0x30) == 0x10 then
                    offset = offset + 1 -- 8
                    if bit.band(ranking, 0x0C) == 0x0C then
                        offset = offset + 1 -- 9
                    end
                elseif bit.band(ranking, 0x0C) == 0x08 then
                    offset = offset + 3 -- 10
                    if bit.band(ranking, 0x30) == 0x30 then
                        offset = offset + 1 -- 11
                    end
                elseif bit.band(ranking, 0x0C) == 0x04 then
                    offset = offset + 6 -- 13
                end
            elseif bit.band(ranking, 0x0C) == 0x04 then
                offset = offset + 15 -- 15
                if bit.band(ranking, 0x30) == 0x02 then
                    offset = offset + 3 -- 18
                    if bit.band(ranking, 0x03) == 0x03 then
                        offset = offset + 1 -- 19
                    end
                elseif bit.band(ranking, 0x30) == 0x10 then
                    offset = offset + 6 -- 21
                end
            elseif bit.band(ranking, 0x30) == 0x10 then
                offset = offset + 23 -- 23
                if bit.band(ranking, 0x0C) == 0x08 then
                    offset = offset + 3 -- 26
                    if bit.band(ranking, 0x30) == 0x30 then
                        offset = offset + 1 -- 27
                    end
                end
            end

            player:messageText(player, messageBase + offset, 5) -- Global balance of power:

            if isConquestAlliance() then
                if bit.band(ranking, 0x03) == 0x01 then
                    player:messageText(player, messageBase + 50, 5) -- Bastok and Windurst have formed an alliance.
                elseif bit.band(ranking, 0x0C) == 0x04 then
                    player:messageText(player, messageBase + 51, 5) -- San d'Oria and Windurst have formed an alliance.
                elseif bit.band(ranking, 0x30) == 0x10 then
                    player:messageText(player, messageBase + 52, 5) -- San d'Oria and Bastok have formed an alliance.
                end
            end

        -- CONQUEST UPDATE
        elseif updatetype == CONQUEST_UPDATE then
            local influence = GetRegionInfluence(region)

            if owner <= 3 then
                player:messageText(player, messageBase + 32 + owner, 5) -- This region is currently under {NATION} control.
            else
                player:messageText(player, messageBase + 31, 5) -- This region is currently under beastman control.
            end

            if influence >= 64 then
                player:messageText(player, messageBase + 37, 5) -- The beastmen are on the rise.
            elseif influence == 0 then
                player:messageText(player, messageBase + 36, 5) -- All three nations are at a deadlock.
            else
                local sandoria = bit.band(influence, 0x03)
                local bastok = bit.rshift(bit.band(influence, 0x0C),2)
                local windurst = bit.rshift(bit.band(influence, 0x30),4)

                player:messageText(player, messageBase + 41 - sandoria, 5) -- Regional influence: San d'Oria
                player:messageText(player, messageBase + 45 - bastok, 5)   -- Regional influence: Bastok
                player:messageText(player, messageBase + 49 - windurst, 5) -- Regional influence: Windurst
            end

            if isConquestAlliance() then
                if bit.band(ranking, 0x03) == 0x01 then
                    player:messageText(player, messageBase + 53, 5) -- Bastok and Windurst are currently allies.
                elseif bit.band(ranking, 0x0C) == 0x04 then
                    player:messageText(player, messageBase + 54, 5) -- San d'Oria and Windurst are currently allies.
                elseif bit.band(ranking, 0x30) == 0x10 then
                    player:messageText(player, messageBase + 55, 5) -- San d'Oria and Bastok are currently allies.
                end
            end
        end
    end
end

dsp.conq = dsp.conquest
